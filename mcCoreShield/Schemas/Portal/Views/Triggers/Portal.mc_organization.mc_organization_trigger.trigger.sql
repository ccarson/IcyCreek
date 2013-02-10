CREATE TRIGGER  Portal.mc_organization_trigger
            ON  Portal.mc_organization
INSTEAD OF INSERT, DELETE, UPDATE
AS
/*
************************************************************************************************************************************

    Trigger:  Portal.mc_organization_trigger
     Author:  Chris Carson
    Purpose:  Prepares data for coreSHIELD processing

    revisor     date          description
    ---------   -----------   ----------------------------
    ccarson     2012-09-01    Created


    Logic Summary:

************************************************************************************************************************************
*/
BEGIN

    IF  @@ROWCOUNT = 0 RETURN ;

    SET NOCOUNT ON;

    DECLARE @rc           AS INT,
            @systemID     AS INT,
            @operation    AS NVARCHAR(50),
            @recordsIN    AS INT,
            @errorMessage AS NVARCHAR(MAX);

    SELECT  @systemID = id
      FROM     dbo.transitionSystems
     WHERE     systemName = DB_NAME() ;

    SELECT  *
      INTO  #mc_organization
      FROM  Portal.mc_organization
     WHERE  1=0 ;

     ALTER TABLE #mc_organization ALTER COLUMN id INT NULL ;

    IF  EXISTS ( SELECT 1 FROM inserted )
        IF  EXISTS ( SELECT 1 FROM deleted )
            SELECT  @operation = N'UPDATE' ;
        ELSE
            SELECT  @operation = N'INSERT' ;
    ELSE
        SELECT  @operation = N'DELETE' ;

    INSERT #mc_organization
    SELECT * FROM deleted  WHERE @operation = 'DELETE'
        UNION ALL
    SELECT * FROM inserted WHERE @operation <> 'DELETE'  ;
    SELECT  @recordsIN = @@ROWCOUNT ;

    ALTER TABLE #mc_organization ADD
        organizationID UNIQUEIDENTIFIER DEFAULT NEWSEQUENTIALID() WITH VALUES ;

    EXECUTE @rc = mcCoreSHIELD.dbo.process_mc_organization @systemID
                                                         , @recordsIN
                                                         , @operation
                                                         , @errorMessage OUTPUT ;

    IF ( @rc > 0 )
        RAISERROR ( @errorMessage, 16, @rc ) ;
END
