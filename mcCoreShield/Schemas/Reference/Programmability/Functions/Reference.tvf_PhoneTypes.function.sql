CREATE FUNCTION Reference.tvf_PhoneTypes ( @portalName AS NVARCHAR(50) )
RETURNS TABLE
AS
/*
************************************************************************************************************************************

   Function:    Reference.tvf_PhoneTypes
     Author:    Chris Carson
    Purpose:    Creates core version of Reference.PhoneTypes showing all portals and values

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
        SELECT  id            = PhoneTypeID
              , typename      = PhoneTypeName
              , active        = isActive
              , display_order = displayOrder
          FROM  Reference.PhoneTypes
         WHERE  portalName = @portalName AND isExcluded = 1 ) ,

        allPortals AS (
        SELECT  id            = PhoneTypeID
              , typename      = PhoneTypeName
              , active        = isActive
              , display_order = displayOrder
          FROM  Reference.PhoneTypes
         WHERE  portalName = 'All'
           AND  NOT EXISTS ( SELECT 1 FROM Reference.PhoneTypes
                              WHERE PhoneTypeID = 0 AND portalName = @portalName )
            EXCEPT
        SELECT  * FROM exclusions ) ,

        portalSpecific AS (
        SELECT  id            = PhoneTypeID
              , typename      = PhoneTypeName
              , active        = isActive
              , display_order = displayOrder
          FROM  Reference.PhoneTypes
         WHERE  portalName = @portalName
           AND  PhoneTypeID > 0
           AND  isExcluded = 0 )

SELECT  id, typename, active, display_order
  FROM  allPortals
    UNION ALL
SELECT  id, typename, active, display_order
  FROM  portalSpecific ;
