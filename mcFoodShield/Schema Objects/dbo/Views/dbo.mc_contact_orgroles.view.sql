CREATE VIEW dbo.mc_contact_orgroles
/*
************************************************************************************************************************************

       View:    dbo.mc_contact_orgroles
     Author:    Chris Carson
    Purpose:    portal view of dbo.ContactOrgRoles data

    revisor     date            description
    ---------   -----------     ----------------------------
    ccarson     2012-09-01      Created
    ccarson     ###DATE###      refactored to use Core.mc_contact_orgroles view


    Notes

************************************************************************************************************************************
*/
AS
    SELECT  id             = id
          , user_id        = user_id
          , org_id         = org_id
          , dept_id        = dept_id
          , role_id        = role_id
          , is_head        = is_head
          , date_added     = date_added
          , added_by       = added_by
          , date_modified  = date_modified
          , modified_by    = modified_by
      FROM  Core.mc_contact_orgroles
     WHERE  portalName = 'mcFoodShield' ;
