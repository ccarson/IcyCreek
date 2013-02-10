CREATE VIEW Portal.mc_organization
AS
/*
************************************************************************************************************************************
            
       View:    Portal.mc_organization
     Author:    Chris Carson
       Date:    2012-09-01

    revisor    Version  date            description
    ---------  -------  -----------     ----------------------------
    ccarson    1.0      2012-09-01      Created
    
    portal view of data from coreSHIELD.dbo.Organizations and coreSHIELD.dbo.OrganizationSystems  
    

************************************************************************************************************************************
*/
        SELECT  id              = os.mc_organizationID
              , Name            = o.Name
              , Website         = o.Website
              , Status          = o.Status
              , Summary         = o.Summary
              , type_id         = os.organizationTypeID
              , vertical_id     = os.verticalID
              , active          = o.isActive
              , brand_id        = o.brandID
              , is_demo         = o.isDemo
              , temp            = o.isTemp
              , date_added      = os.createdOn
              , added_by        = ISNULL( x.ContactsID, 0 )
              , date_updated    = os.updatedOn
              , updated_by      = ISNULL( y.ContactsID, 0 )
          FROM  dbo.Organizations       AS o
    INNER JOIN  dbo.OrganizationSystems AS os
            ON  os.id = o.id
    INNER JOIN  dbo.transitionSystems   AS s
            ON  s.id  = os.systemID AND s.systemName = DB_NAME()
     LEFT JOIN  dbo.vw_transitionContacts AS x 
            ON  x.id = os.createdBy AND x.transitionSystemsID = os.systemID
     LEFT JOIN  dbo.vw_transitionContacts AS y
            ON  y.id = os.updatedBy AND y.transitionSystemsID = os.systemID ; 
            
