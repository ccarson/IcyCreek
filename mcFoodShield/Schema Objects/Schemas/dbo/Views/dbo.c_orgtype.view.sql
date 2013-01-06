CREATE VIEW dbo.c_orgtype
/*
************************************************************************************************************************************

      View:  dbo.c_orgtype
    Author:  Chris Carson
   Purpose:  retrieves portal version of core Reference.OrganizationTypes


    revisor     date          description
    ---------   -----------   ----------------------------
    ccarson     2012-08-24    Created


Logic Summary:
    Combine results of three CTEs to provide view of OrganizationTypes data:

    1)  org types that are excluded from current portal
    2)  org types that are set up for all portals
    3)  org types that are included only for current portal

************************************************************************************************************************************
*/
AS

      WITH  exclusions AS (
            SELECT  id       = OrganizationTypeID
                  , typename = OrganizationTypeName
                  , active   = isActive
              FROM  mcCoreShield.Reference.OrganizationTypes
             WHERE  portalName = DB_NAME() AND isExcluded = 1 ) ,

            allPortals AS (
            SELECT  id       = OrganizationTypeID
                  , typename = OrganizationTypeName
                  , active   = isActive
              FROM  mcCoreShield.Reference.OrganizationTypes
             WHERE  portalName = 'All'
               AND  NOT EXISTS ( SELECT 1 FROM mcCoreShield.Reference.OrganizationTypes
                                  WHERE OrganizationTypeID = 0 AND portalName = DB_NAME() )
                EXCEPT
            SELECT  * FROM exclusions ) ,

            portalSpecific AS (
            SELECT  id       = OrganizationTypeID
                  , typename = OrganizationTypeName
                  , active   = isActive
              FROM  mcCoreShield.Reference.OrganizationTypes
             WHERE  portalName = DB_NAME()
               AND  OrganizationTypeID > 0
               AND  isExcluded = 0 )

    SELECT  id, typename, active
      FROM  allPortals
        UNION ALL
    SELECT  id, typename, active
      FROM  portalSpecific ;
