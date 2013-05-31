CREATE FUNCTION Reference.tvf_EmailTypes ( @portalName AS NVARCHAR(50) )
RETURNS TABLE
AS
/*
************************************************************************************************************************************

   Function:    Reference.tvf_EmailTypes
     Author:    Chris Carson
    Purpose:    Creates core version of Reference.EmailTypes showing all portals and values

    revisor     date          description
    ---------   -----------   ----------------------------
    ccarson     2012-08-24    Created


    Logic Summary:
    1)  Select values that should be excluded from given portals
    2)  Load values for all portals ( if portal is "Exclude All" then nothing is returned )
    3)  Load values that are specific to each portal

    Function Arguments:
    @portalName        NVARCHAR(50)    portal for which table is being built

************************************************************************************************************************************
*/
RETURN

  WITH  exclusions AS (
        SELECT  id            = EmailTypeID
              , typename      = EmailTypeName
              , active        = isActive
              , display_order = displayOrder
          FROM  Reference.EmailTypes
         WHERE  portalName = @portalName AND isExcluded = 1 ) ,

        allPortals AS (
        SELECT  id            = EmailTypeID
              , typename      = EmailTypeName
              , active        = isActive
              , display_order = displayOrder
          FROM  Reference.EmailTypes
         WHERE  portalName = 'All'
           AND  NOT EXISTS ( SELECT 1 FROM Reference.EmailTypes
                              WHERE EmailTypeID = 0 AND portalName = @portalName )
            EXCEPT
        SELECT  * FROM exclusions ) ,

        portalSpecific AS (
        SELECT  id            = EmailTypeID
              , typename      = EmailTypeName
              , active        = isActive
              , display_order = displayOrder
          FROM  Reference.EmailTypes
         WHERE  portalName = @portalName
           AND  EmailTypeID > 0
           AND  isExcluded = 0 )

SELECT  id, typename, active, display_order
  FROM  allPortals
    UNION ALL
SELECT  id, typename, active, display_order
  FROM  portalSpecific ;
