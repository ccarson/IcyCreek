CREATE VIEW dbo.c_orgvertical
/*
************************************************************************************************************************************

      View:  dbo.c_orgvertical
    Author:  Chris Carson
   Purpose:  retrieves portal version of core Reference.Verticals


    revisor     date          description
    ---------   -----------   ----------------------------
    ccarson     2012-08-24    Created


Logic Summary:
    Combine results of three CTEs to provide view of Verticals data:

    1)  Verticals that are excluded from current portal
    2)  Verticals that are set up for all portals
    3)  Verticals that are included only for current portal

************************************************************************************************************************************
*/
AS
      WITH  exclusions AS (
            SELECT  id           = VerticalID
                  , verticalname = VerticalName
                  , active       = isActive
                  , noedit       = noEdit
              FROM  mcCoreShield.Reference.Verticals
             WHERE  portalName = DB_NAME() AND isExcluded = 1 ) ,

            allPortals AS (
            SELECT  id           = VerticalID
                  , verticalname = VerticalName
                  , active       = isActive
                  , noedit       = noEdit
              FROM  mcCoreShield.Reference.Verticals
             WHERE  portalName = 'All'
               AND  NOT EXISTS ( SELECT 1 FROM mcCoreShield.Reference.Verticals
                                  WHERE VerticalID = 0 AND portalName = DB_NAME() )
                EXCEPT
            SELECT  * FROM exclusions ) ,

            portalSpecific AS (
            SELECT  id           = VerticalID
                  , verticalname = VerticalName
                  , active       = isActive
                  , noedit       = noEdit
              FROM  mcCoreShield.Reference.Verticals
             WHERE  portalName = DB_NAME()
               AND  VerticalID > 0
               AND  isExcluded = 0 )

    SELECT  id, verticalname, active, noedit
      FROM  allPortals
        UNION ALL
    SELECT  id, verticalname, active, noedit
      FROM  portalSpecific ;
