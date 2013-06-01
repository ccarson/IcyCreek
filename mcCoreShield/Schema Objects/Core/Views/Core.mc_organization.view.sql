CREATE VIEW Core.mc_organization
WITH SCHEMABINDING
/*
************************************************************************************************************************************

       View:  Core.mc_organization
     Author:  ccarson
    Purpose:  shows Core version of mc_organization view, showing all portal data in a single view


    revisor         date                description
    ---------       -----------         ----------------------------
    ccarson         ###DATE###          created

    Notes:
    This is the "all portals" equivalent of the portal view of the same name.
    The coreShield version of the view contains system fields and coreShieldIDs for the portal ID fieldd

************************************************************************************************************************************
*/
AS
    SELECT  id              = ogs.mc_organizationID
          , Name            = org.Name
          , Website         = org.Website
          , Status          = org.Status
          , Summary         = org.Summary
          , type_id         = ogs.organizationTypeID
          , vertical_id     = ogs.verticalID
          , active          = org.isActive
          , brand_id        = org.brandID
          , is_demo         = org.isDemo
          , temp            = org.isTemp
          , date_added      = ogs.createdOn
          , added_by        = COALESCE( cn1.mc_contactID, 0 )
          , date_updated    = ogs.updatedOn
          , updated_by      = COALESCE( cn2.mc_contactID, 0 )
          , portalName      = sys.systemName
          , systemID        = sys.ID
          , organizationID  = ogs.ID
          , createdID       = cn1.ID
          , updatedID       = cn2.ID
      FROM  dbo.Organizations       AS org
INNER JOIN  dbo.OrganizationSystems AS ogs ON ogs.ID = org.ID
INNER JOIN  Reference.Systems       AS sys ON sys.ID = ogs.systemID
 LEFT JOIN  dbo.ContactSystems      AS cn1 ON cn1.ID = ogs.createdBy AND cn1.systemID = sys.ID
 LEFT JOIN  dbo.ContactSystems      AS cn2 ON cn2.ID = ogs.updatedBy AND cn2.systemID = sys.ID ;