CREATE PROCEDURE dbo.process_mc_organization ( @systemID     AS INT
                                             , @recordsIN    AS INT
                                             , @operation    AS NVARCHAR(20)
                                             , @errorMessage AS NVARCHAR(MAX) OUTPUT )
AS
/*
************************************************************************************************************************************
  
  Procedure: dbo.process_mc_organization
     Author: Chris Carson
    Purpose: Processes data from portal view trigger for dbo.Organizations and dbo.OrganizationSystems tables on coreSHIELD

    revisor     date            description
    ---------   -----------     ----------------------------
    ccarson     2012-09-01      created


    Logic Summary:
        @action = INSERT:
            1) Assign new portal.dbo.mc_organization.id to incoming records
            2) Assign existing Organization.id to incoming records with same name
            3) MERGE incoming data into dbo.Organizations
            4) INSERT new data onto OrganizationSystems
            5) update userIDs on dbo.Organizations

        @action = UPDATE:
            6) update OrganizationIDs on incoming data
            7) update dbo.Organizations with incoming data
            8) update dbo.OrganizationSystems with incoming data

        @action = DELETE:
            9) update OrganizationIDs on incoming data
           10) DELETE data from dbo.OrganizationSystems
           11) DELETE dbo.Organizations if no dbo.OrganizationSystems records remain
************************************************************************************************************************************
*/
BEGIN

    SET NOCOUNT ON ;

    DECLARE @updated             AS INT = 0
          , @rows                AS INT = 0
          , @organizationInserts AS INT = 0
          , @organizationUpdates AS INT = 0
          , @legacyID            AS INT = 0
          , @inserted            AS INT = 0
          , @deleted             AS INT = 0 ;

    DECLARE @mergeResults AS TABLE ( action         NVARCHAR(50)
                                   , organizationID UNIQUEIDENTIFIER ) ;

    IF  ( @operation = 'INSERT' )
    BEGIN

    --  1)  Assign new portal.dbo.mc_organization.id to incoming records
        SELECT  @legacyID = COALESCE( MAX( mc_organizationID ), 0 )
          FROM  dbo.OrganizationSystems
         WHERE  systemID = @systemID ;

        UPDATE  #mc_organization
           SET  @legacyID = id = @legacyID + 1
         WHERE  id IS NULL ;
        SELECT  @rows = @@ROWCOUNT ;

        IF  ( @rows <> @recordsIN )
        BEGIN
            SELECT  @errorMessage = N'Error on #mc_organization UPDATE' + CHAR(13) +
                                    N'Records in were       : ' + CAST( @recordsIN  AS NVARCHAR(20) ) + CHAR(13) +
                                    N'Records UPDATEd were  : ' + CAST( @rows       AS NVARCHAR(20) ) ;
            RETURN 1 ;
        END


    --  2)  Assign existing Organization.id to incoming records with same name
;         WITH  matchingNames AS ( 
                SELECT  N    = ROW_NUMBER() OVER ( PARTITION BY Name ORDER BY systemID, mc_organizationID ) 
                      , id   = o.id
                      , name = o.name 
                  FROM  dbo.Organizations AS o 
            INNER JOIN  dbo.OrganizationSystems AS os 
                    ON  os.id = o.id ) 
    
        UPDATE  #mc_organization
           SET  OrganizationID = a.id
          FROM  matchingNames     AS a
    INNER JOIN  #mc_organization  AS b 
            ON  a.Name = b.Name AND a.N = 1 ;


    --  3)  MERGE incoming data into dbo.Organizations
                -- Matched records were set in previous step, incoming data updates existing records
                -- Unmatched records are new organizations
         MERGE  dbo.Organizations AS tgt
         USING  #mc_organization  AS src
            ON  src.organizationID = tgt.id
          WHEN  MATCHED THEN
                UPDATE SET Name         = src.Name
                         , Website      = src.Website
                         , Status       = src.Status
                         , Summary      = src.Summary
                         , isActive     = src.active
                         , isDemo       = src.is_demo
                         , isTemp       = src.temp
                         , brandID      = src.brand_id
                         , updatedOn    = src.date_added
                         , updatedBy    = ( SELECT ContactsID FROM dbo.tvf_getCoreContactsID( src.added_by, @systemID ) )
          WHEN  NOT MATCHED BY TARGET THEN
                INSERT ( id, Name, Website, Status
                            , Summary, isActive
                            , isDemo, isTemp, brandID
                            , CreatedOn, UpdatedOn )
                VALUES ( src.organizationID, src.Name, src.Website, src.Status
                            , src.Summary, src.active
                            , COALESCE( is_demo, 0 ), temp, brand_id
                            , src.date_added, src.date_updated )
        OUTPUT  $action, inserted.id INTO @mergeResults ;
        SELECT  @rows = @@ROWCOUNT ;

        SELECT  @organizationInserts = ( SELECT COUNT(*) FROM @mergeResults WHERE action = 'INSERT' )
              , @organizationUpdates = ( SELECT COUNT(*) FROM @mergeResults WHERE action = 'UPDATE' ) ;

        IF  ( @rows <> @recordsIN ) OR ( ( @organizationInserts + @organizationUpdates ) <> @recordsIN )
        BEGIN
            SELECT  @errorMessage = N'Error on dbo.Organizations MERGE' + CHAR(13) +
                                    N'Records in were       : ' + CAST( @recordsIN           AS NVARCHAR(20) ) + CHAR(13) +
                                    N'Records INSERTed were : ' + CAST( @organizationInserts AS NVARCHAR(20) ) + CHAR(13) +
                                    N'Records UPDATEd were  : ' + CAST( @organizationUpdates AS NVARCHAR(20) ) + CHAR(13) +
                                    N'Records MERGEd were   : ' + CAST( @rows                AS NVARCHAR(20) ) ;
            RETURN 2 ;
        END


    --  4)  INSERT new data onto OrganizationSystems
        INSERT  dbo.OrganizationSystems (
                    id, systemID
                        , organizationTypeID, verticalID
                        , createdBy, updatedBy
                        , createdOn, updatedOn
                        , mc_organizationID )
        SELECT  o.organizationID, @systemID
                    , o.type_id, o.vertical_id
                    , x.ContactsID, y.ContactsID
                    , o.date_added, o.date_updated
                    , o.id
          FROM  #mc_organization AS o
   OUTER APPLY  dbo.tvf_getCoreContactsID( o.added_by, @systemID )   AS x
   OUTER APPLY  dbo.tvf_getCoreContactsID( o.updated_by, @systemID ) AS y ;
        SELECT  @rows = @@ROWCOUNT ;
        IF ( @rows <> @recordsIN )
        BEGIN
            SELECT  @errorMessage = N'Error on dbo.OrganizationSystems INSERT' + CHAR(13) +
                                    N'Records in were       : ' + CAST( @recordsIN AS NVARCHAR(20) ) + CHAR(13) +
                                    N'Records INSERTed were : ' + CAST( @rows      AS NVARCHAR(20) ) ;
            RETURN 3 ;
        END

        
    --  5)  update userIDs on dbo.Organizations ONLY for Organizations that were INSERTed
        UPDATE  dbo.Organizations
           SET  createdBy = x.ContactsID
              , updatedBy = y.ContactsID
          FROM  dbo.Organizations AS o
    INNER JOIN  #mc_organization  AS mo ON mo.organizationID = o.id
   OUTER APPLY  dbo.tvf_getCoreContactsID( mo.added_by, @systemID )   AS x
   OUTER APPLY  dbo.tvf_getCoreContactsID( mo.updated_by, @systemID ) AS y
         WHERE  NOT EXISTS ( SELECT  1
                               FROM  @mergeResults AS mr
                              WHERE  mo.OrganizationID = mr.OrganizationID
                                AND  mr.action = 'UPDATE' ) ;
        SELECT  @rows = @@ROWCOUNT ;
        IF ( @rows <> @organizationInserts )
        BEGIN
            SELECT  @errorMessage = N'Error on dbo.Organizations UPDATE' + CHAR(13) +
                                    N'Records inserted by MERGE   : ' + CAST( @organizationInserts AS NVARCHAR(20) ) + CHAR(13) +
                                    N'Records updated after MERGE : ' + CAST( @rows                AS NVARCHAR(20) ) ;
            RETURN 4 ;
        END
    END

    IF  ( @operation = 'UPDATE' )
    BEGIN

    --  6)  update OrganizationIDs on incoming data
        UPDATE  #mc_organization
           SET  organizationID = x.OrganizationsID
          FROM  #mc_organization AS mo
   CROSS APPLY  dbo.tvf_getCoreOrganizationsID( mo.id, @systemID ) AS x;
        SELECT  @updated = @@ROWCOUNT ;

        IF  ( @updated <> @recordsIN )
        BEGIN
            SELECT  @errorMessage = N'Error on #mc_organization UPDATE' + CHAR(13) +
                                    N'Records in were      : ' + CAST( @recordsIN AS NVARCHAR(20) ) + CHAR(13) +
                                    N'Records updated were : ' + CAST( @updated   AS NVARCHAR(20) ) + CHAR(13) ;
            RETURN 5 ;
        END


    --  7)  update dbo.Organizations with incoming data
        UPDATE  dbo.Organizations
           SET  Name       = mo.Name
              , Website    = mo.Website
              , Status     = mo.Status
              , Summary    = mo.Summary
              , isActive   = mo.active
              , isDemo     = mo.is_demo
              , isTemp     = mo.temp
              , brandID    = mo.brand_id
              , updatedBy  = x.ContactsID
              , updatedOn  = mo.date_updated
          FROM  dbo.Organizations AS o
    INNER JOIN  #mc_organization AS mo
            ON  mo.OrganizationID = o.id
   OUTER APPLY  dbo.tvf_getCoreContactsID( mo.updated_by, @systemID ) AS x
        SELECT  @updated = @@ROWCOUNT ;

        IF ( @updated <> @recordsIN )
        BEGIN
            SELECT  @errorMessage = N'Error on dbo.Organizations UPDATE' + CHAR(13) +
                                    N'Records in were      : ' + CAST( @inserted AS NVARCHAR(20) ) + CHAR(13) +
                                    N'Records updated were : ' + CAST( @updated  AS NVARCHAR(20) ) ;
            RETURN 6 ;
        END


    --  8)  update dbo.OrganizationSystems with incoming data
        UPDATE  dbo.OrganizationSystems
           SET  organizationTypeID = mo.type_id
              , verticalID         = mo.vertical_id
              , updatedBy          = x.ContactsID
              , updatedOn          = mo.date_updated
          FROM  dbo.OrganizationSystems AS os
    INNER JOIN  #mc_organization        AS mo
            ON  os.mc_organizationID = mo.id AND os.systemID = @systemID
   OUTER APPLY  dbo.tvf_getCoreContactsID( mo.updated_by, @systemID ) AS x ;
        SELECT  @updated = @@ROWCOUNT ;

        IF  ( @updated <> @recordsIN )
        BEGIN
            SELECT  @errorMessage = N'Error on dbo.OrganizationSystems UPDATE' + CHAR(13) +
                                    N'Records in were      : ' + CAST( @inserted AS NVARCHAR(20) ) + CHAR(13) +
                                    N'Records updated were : ' + CAST( @updated  AS NVARCHAR(20) ) ;
            RETURN 7 ;
        END
    END

    IF  ( @operation = 'DELETE' )
    BEGIN
    
    --  9)  update OrganizationIDs on incoming data
        UPDATE  #mc_organization
           SET  organizationID = x.OrganizationsID
          FROM  #mc_organization AS mo
   CROSS APPLY  dbo.tvf_getCoreOrganizationsID( mo.id, @systemID ) AS x ;
      

    --  10) DELETE data from dbo.OrganizationSystems
        DELETE  dbo.OrganizationSystems
         WHERE  EXISTS ( SELECT  1
                           FROM  #mc_organization AS d
                          WHERE  d.OrganizationID = dbo.OrganizationSystems.id AND systemID = @systemID ) ;
        SELECT   @deleted = @@ROWCOUNT ;

        IF  ( @deleted <> @recordsIN )
        BEGIN
            SELECT  @errorMessage = N'Error on dbo.OrganizationSystems DELETE' + CHAR(13) +
                                    N'Records in were      : ' + CAST( @recordsIN AS NVARCHAR(20) ) + CHAR(13) +
                                    N'Records DELETEd were : ' + CAST( @deleted   AS NVARCHAR(20) ) ;
            RETURN 9 ;
        END


    --  10) DELETE dbo.Organizations if no dbo.OrganizationSystems records remain
        DELETE  dbo.Organizations
          FROM  dbo.Organizations AS o
         WHERE  EXISTS ( SELECT 1 FROM #mc_organization AS mo 
                          WHERE mo.OrganizationID = o.id ) 
                    AND NOT
                EXISTS ( SELECT 1 FROM dbo.OrganizationSystems AS OS
                          WHERE os.id = o.id ) ; 

    END
END
