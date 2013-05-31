CREATE VIEW Core.mc_org_location
WITH SCHEMABINDING
/*
************************************************************************************************************************************

       View:  Core.mc_org_location
     Author:  ccarson
    Purpose:  shows Core version of mc_org_location view, showing all portal data in a single view


    revisor         date                description
    ---------       -----------         ----------------------------
    ccarson         ###DATE###          created

    Notes:
    This is the "all portals" equivalent of the portal view of the same name.
    The coreShield version of the view contains system fields and coreShieldIDs for the portal ID fieldd

************************************************************************************************************************************
*/
AS
    SELECT  id                  = ols.mc_org_locationID
          , org_id              = ogs.mc_organizationID
          , addressTypeID       = ogl.addressTypeID
          , name                = ogl.name
          , address1            = ogl.address1
          , address2            = ogl.address2
          , address3            = ogl.address3
          , city                = ogl.city
          , state               = ogl.state
          , zip                 = ogl.zip
          , d_phone             = ogl.phone
          , d_fax               = ogl.fax
          , active              = ogl.isActive
          , notes               = ogl.notes
          , country             = ogl.country
          , d_emergency_phone   = ogl.emergencyPhone
          , d_24hr_phone        = ogl.allHoursPhone
          , d_infectious_phone  = ogl.infectiousPhone
          , bAlternate          = ogl.isAlternate
          , date_added          = ols.createdOn
          , date_updated        = ols.updatedOn
          , portalName          = sys.systemName
          , systemID            = sys.ID
          , orgLocationID       = ogl.ID
          , organizationID      = ogs.ID
      FROM  dbo.OrgLocations        AS ogl
INNER JOIN  dbo.OrgLocationSystems  AS ols ON ols.ID = ogl.ID
INNER JOIN  Reference.Systems       AS sys ON sys.ID = ols.systemID
INNER JOIN  dbo.OrganizationSystems AS ogs ON ogs.ID = ogl.organizationID AND ogs.systemID = sys.ID ;