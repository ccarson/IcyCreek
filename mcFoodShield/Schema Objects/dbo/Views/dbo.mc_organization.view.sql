CREATE VIEW dbo.mc_organization
AS
/*
************************************************************************************************************************************

       View:    dbo.mc_organization
     Author:    Chris Carson
    Purpose:    portal view of dbo.Organizations data

    revisor     date            description
    ---------   -----------     ----------------------------
    ccarson     2012-09-01      Created
    ccarson     2013-03-05      refactored to use Core.mc_organization view


    Notes

************************************************************************************************************************************
*/
    SELECT  id              = id
          , Name            = Name
          , Website         = Website
          , Status          = Status
          , Summary         = Summary
          , type_id         = type_id
          , vertical_id     = vertical_id
          , active          = active
          , brand_id        = brand_id
          , is_demo         = is_demo
          , temp            = temp
          , date_added      = date_added
          , added_by        = added_by
          , date_updated    = date_updated
          , updated_by      = updated_by
      FROM  Core.mc_organization
     WHERE  portalName = 'mcFoodShield ' ;
