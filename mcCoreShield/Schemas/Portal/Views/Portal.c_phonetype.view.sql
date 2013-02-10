CREATE VIEW Portal.c_phonetype
/*
************************************************************************************************************************************

      View:  Portal.c_phonetype
    Author:  Chris Carson
   Purpose:  retrieves portal version of core Reference.OrganizationTypes


    revisor     date          description
    ---------   -----------   ----------------------------
    ccarson     2012-08-24    Created


Logic Summary:
    Combine results of three CTEs to provide view of PhoneTypes data:

    1)  phone types that are excluded from current portal
    2)  phone types that are set up for all portals
    3)  phone types that are included only for current portal

************************************************************************************************************************************
*/
AS

      WITH  exclusions AS (
            SELECT  id            = PhoneTypeID
                  , typename      = PhoneTypeName
                  , active        = isActive
                  , display_Order = displayOrder
              FROM  mcCoreShield.Reference.PhoneTypes
             WHERE  portalName = DB_NAME() AND isExcluded = 1 ) ,

            allPortals AS (
            SELECT  id            = PhoneTypeID
                  , typename      = PhoneTypeName
                  , active        = isActive
                  , display_Order = displayOrder
              FROM  mcCoreShield.Reference.PhoneTypes
             WHERE  portalName = 'All'
               AND  NOT EXISTS ( SELECT 1 FROM mcCoreShield.Reference.PhoneTypes
                                  WHERE PhoneTypeID = 0 AND portalName = DB_NAME() )
                EXCEPT
            SELECT  * FROM exclusions ) ,

            portalSpecific AS (
            SELECT  id            = PhoneTypeID
                  , typename      = PhoneTypeName
                  , active        = isActive
                  , display_Order = displayOrder
              FROM  mcCoreShield.Reference.PhoneTypes
             WHERE  portalName = DB_NAME()
               AND  PhoneTypeID > 0
               AND  isExcluded = 0 )

    SELECT  id, typename, active, display_Order
      FROM  allPortals
        UNION ALL
    SELECT  id, typename, active, display_Order
      FROM  portalSpecific ;
