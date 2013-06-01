CREATE VIEW dbo.mc_contact_organizations
/*
************************************************************************************************************************************

       View:  dbo.mc_contact_organizations
     Author:  Chris Carson
    Purpose:  portal view of dbo.ContactOrganizations data

    revisor     date            description
    ---------   -----------     ----------------------------
    ccarson     ###DATE###      created


    Notes

************************************************************************************************************************************
*/
AS
    SELECT  id                      = id
          , user_id                 = user_id
          , org_id                  = org_id
          , org_dept_id             = org_dept_id
          , location_id             = location_id
          , defaultorg              = defaultorg
          , chosenorg               = chosenorg
          , emergency_contact       = emergency_contact
          , date_added              = date_added
          , date_updated            = date_updated
      FROM  Core.mc_contact_organizations
     WHERE  portalName = 'mcFoodShield' ;
