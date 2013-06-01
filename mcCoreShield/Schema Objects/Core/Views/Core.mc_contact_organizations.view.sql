CREATE VIEW Core.mc_contact_organizations
WITH SCHEMABINDING
/*
************************************************************************************************************************************

       View:  Core.mc_contact_organizations
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
    SELECT  id                      = cgs.mc_contact_organizationsID
          , user_id                 = cns.mc_contactID
          , org_id                  = ogs.mc_organizationID
          , org_dept_id             = COALESCE( ods.mc_org_departmentsID, 0 ) 
          , location_id             = COALESCE( ols.mc_org_locationID, 0 ) 
          , defaultorg              = cog.isDefault
          , chosenorg               = cog.isChosen
          , emergency_contact       = cog.isEmergencyContact
          , date_added              = cgs.createdOn
          , date_updated            = cgs.updatedOn
          , portalName              = sys.systemName
          , systemID                = sys.ID
          , contactOrganizationID   = cgs.ID
          , contactID               = cns.ID
          , organizationID          = ogs.ID
          , orgDepartmentID         = ods.ID
          , orgLocationID           = ols.Id
      FROM  dbo.ContactOrganizations AS cog
INNER JOIN  dbo.ContactOrgSystems    AS cgs ON cgs.ID = cog.ID
INNER JOIN  Reference.Systems        AS sys ON sys.ID = cgs.systemID
INNER JOIN  dbo.ContactSystems       AS cns ON cns.ID = cog.contactsID       AND cns.systemID = sys.ID
INNER JOIN  dbo.OrganizationSystems  AS ogs ON ogs.ID = cog.organizationsID  AND ogs.systemID = sys.ID
 LEFT JOIN  dbo.OrgDepartmentSystems AS ods ON ods.ID = cog.orgDepartmentsID AND ods.systemID = sys.ID 
 LEFT JOIN  dbo.OrgLocationSystems   AS ols ON ols.ID = cog.orgLocationsID   AND ols.systemID = sys.ID ;