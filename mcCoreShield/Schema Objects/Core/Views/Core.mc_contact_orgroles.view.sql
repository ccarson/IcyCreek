CREATE VIEW Core.mc_contact_orgroles
--WITH SCHEMABINDING
/*
************************************************************************************************************************************

       View:  Core.mc_contact_orgroles
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
    SELECT  id                      = crs.mc_contact_orgrolesID
          , user_id                 = cn1.mc_contactID
          , org_id                  = ogs.mc_organizationID
          , dept_id                 = COALESCE( ods.mc_org_departmentsID, 0 )
          , role_id                 = trl.RolesID
          , is_head                 = cor.isHead
          , date_added              = crs.createdOn
          , added_by                = COALESCE( cn2.mc_contactID, 0 )
          , date_modified           = crs.updatedOn
          , modified_by             = COALESCE( cn3.mc_contactID, 0 )
          , portalName              = sys.systemName
          , systemID                = sys.ID
          , contactOrgRoleID        = crs.ID
          , contactID               = cn1.ID
          , organizationID          = ogs.ID
          , orgDepartmentID         = ods.ID
          , createdByID             = cn2.ID
          , updatedByID             = cn3.ID
      FROM  dbo.ContactOrgRoles         AS cor
INNER JOIN  dbo.ContactOrgRoleSystems   AS crs ON crs.ID = cor.ID
INNER JOIN  Reference.Systems           AS sys ON sys.ID = crs.systemID
INNER JOIN  dbo.ContactSystems          AS cn1 ON cn1.ID = cor.contactsID       AND cn1.systemID = sys.ID
INNER JOIN  dbo.OrganizationSystems     AS ogs ON ogs.ID = cor.organizationsID  AND ogs.systemID = sys.ID
INNER JOIN  dbo.vw_transitionRoles      AS trl ON trl.ID = cor.rolesID          AND trl.transitionSystemsID = sys.ID
 LEFT JOIN  dbo.OrgDepartmentSystems    AS ods ON ods.ID = cor.orgDepartmentsID AND ods.systemID = sys.ID
 LEFT JOIN  dbo.ContactSystems          AS cn2 ON cn2.ID = crs.createdBy        AND cn2.systemID = sys.ID
 LEFT JOIN  dbo.ContactSystems          AS cn3 ON cn3.ID = crs.updatedBy        AND cn3.systemID = sys.ID ;