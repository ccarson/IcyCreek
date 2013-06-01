CREATE VIEW Core.mc_org_departments
WITH SCHEMABINDING
/*
************************************************************************************************************************************

       View:  Core.mc_org_departments
     Author:  ccarson
    Purpose:  shows Core version of mc_org_departments view, showing all portal data in a single view


    revisor         date                description
    ---------       -----------         ----------------------------
    ccarson         ###DATE###          created

    Notes:
    This is the "all portals" equivalent of the portal view of the same name.
    The coreShield version of the view contains system fields and coreShieldIDs for the portal ID fieldd

************************************************************************************************************************************
*/
AS
      WITH  parents AS (
            SELECT  ID              = ID
                  , systemID        = systemID
                  , parent_dept_id  = mc_org_departmentsID
              FROM  dbo.OrgDepartmentSystems AS ods
             WHERE  EXISTS ( SELECT 1 FROM dbo.OrgDepartments AS ogd WHERE ogd.parentDepartmentID = ods.ID ) )

    SELECT  id                  = ods.mc_org_departmentsID
          , name                = ogd.name
          , org_id              = ogs.mc_organizationID
          , location_id         = ols.mc_org_locationID
          , parent_dept_id      = COALESCE( prn.parent_dept_id, 0 )
          , active              = ogd.isActive
          , notes               = ogd.notes
          , website             = ogd.website
          , org_level           = ogd.orgLevel
          , fern_Active         = ods.isFERNActive
          , micro               = ods.isMicro
          , chem                = ods.isChem
          , rad                 = ods.isRad
          , is_searchable       = ods.isSearchable
          , micro_date_accept   = ods.microAcceptedOn
          , micro_date_withdraw = ods.microWithdrawOn
          , chem_date_accept    = ods.chemAcceptedOn
          , chem_date_withdraw  = ods.chemWithdrawOn
          , rad_date_accept     = ods.radAcceptedOn
          , rad_date_withdraw   = ods.radWithdrawOn
          , date_added          = ods.createdOn
          , added_by            = COALESCE( cn1.mc_contactID, 0 )
          , date_updated        = ods.updatedOn
          , updated_by          = COALESCE( cn2.mc_contactID, 0 )
          , portalName          = sys.systemName
          , systemID            = sys.ID
          , orgDepartmentID     = ogd.ID
          , organizationID      = ogd.organizationID
          , orgLocationID       = ogd.orgLocationID
          , parentDepartmentID  = ogd.parentDepartmentID
          , createdID           = ods.createdBy
          , updatedID           = ods.updatedBy
      FROM  dbo.OrgDepartments       AS ogd
INNER JOIN  dbo.OrgDepartmentSystems AS ods ON ods.ID = ogd.ID
INNER JOIN  Reference.Systems        AS sys ON sys.ID = ods.systemID
INNER JOIN  dbo.OrganizationSystems  AS ogs ON ogs.ID = ogd.organizationID AND ogs.systemID = sys.ID
INNER JOIN  dbo.OrgLocationSystems   AS ols ON ols.ID = ogd.orgLocationID  AND ols.systemID = sys.ID
 LEFT JOIN  parents                  AS prn ON prn.ID = ogd.parentDepartmentID AND prn.systemID = sys.ID
 LEFT JOIN  dbo.ContactSystems       AS cn1 ON cn1.ID = ods.createdBy AND cn1.systemID = sys.ID
 LEFT JOIN  dbo.ContactSystems       AS cn2 ON cn2.ID = ods.updatedBy AND cn2.systemID = sys.ID ;