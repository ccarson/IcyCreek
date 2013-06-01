CREATE VIEW dbo.mc_org_departments
/*
************************************************************************************************************************************

       View:  dbo.mc_org_departments
     Author:  ccarson
    Purpose:  shows portal view of Core.mc_org_departments view, showing data only for specified portal


    revisor         date            description
    ---------       ------------    ----------------------------
    ccarson         2013-03-05      created

    Notes:

************************************************************************************************************************************
*/
AS
    SELECT  id                  = id
          , name                = name
          , org_id              = org_id
          , location_id         = location_id
          , parent_dept_id      = parent_dept_id
          , active              = active
          , notes               = notes
          , website             = website
          , org_level           = org_level
          , fern_active         = fern_active
          , micro               = micro
          , chem                = chem
          , rad                 = rad
          , is_searchable       = is_searchable
          , micro_date_accept   = micro_date_accept
          , micro_date_withdraw = micro_date_withdraw
          , chem_date_accept    = chem_date_accept
          , chem_date_withdraw  = chem_date_withdraw
          , rad_date_accept     = rad_date_accept
          , rad_date_withdraw   = rad_date_withdraw
          , date_added          = date_added
          , added_by            = added_by
          , date_updated        = date_updated
          , updated_by          = updated_by
      FROM  Core.mc_org_departments
     WHERE  portalName = 'mcFoodShield' ;
