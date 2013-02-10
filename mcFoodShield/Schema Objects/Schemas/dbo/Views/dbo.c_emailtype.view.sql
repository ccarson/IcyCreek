CREATE VIEW dbo.c_emailtype
/*
************************************************************************************************************************************

      View:  dbo.c_emailtype
    Author:  Chris Carson
   Purpose:  retrieves portal version of core Reference.OrganizationTypes


    revisor     date          description
    ---------   -----------   ----------------------------
    ccarson     2012-08-24    Created


Logic Summary:
    Combine results of three CTEs to provide view of EmailTypes data:

    1)  email types that are excluded from current portal
    2)  email types that are set up for all portals
    3)  email types that are included only for current portal

************************************************************************************************************************************
*/
AS

      WITH  exclusions AS (
            SELECT  id           = EmailTypeID
                  , typename     = EmailTypeName
                  , active       = isActive
                  , display_Order = displayOrder
              FROM  mcCoreShield.Reference.EmailTypes
             WHERE  portalName = DB_NAME() AND isExcluded = 1 ) ,

            allPortals AS (
            SELECT  id           = EmailTypeID
                  , typename     = EmailTypeName
                  , active       = isActive
                  , display_Order = displayOrder
              FROM  mcCoreShield.Reference.EmailTypes
             WHERE  portalName = 'All'
               AND  NOT EXISTS ( SELECT 1 FROM mcCoreShield.Reference.EmailTypes
                                  WHERE EmailTypeID = 0 AND portalName = DB_NAME() )
                EXCEPT
            SELECT  * FROM exclusions ) ,

            portalSpecific AS (
            SELECT  id           = EmailTypeID
                  , typename     = EmailTypeName
                  , active       = isActive
                  , display_Order = displayOrder
              FROM  mcCoreShield.Reference.EmailTypes
             WHERE  portalName = DB_NAME()
               AND  EmailTypeID > 0
               AND  isExcluded = 0 )

    SELECT  id, typename, active, display_Order
      FROM  allPortals
        UNION ALL
    SELECT  id, typename, active, display_Order
      FROM  portalSpecific ;
