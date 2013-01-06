CREATE VIEW dbo.vw_expandedOrganizations
/*
************************************************************************************************************************************
            
       View:  dbo.vw_expandedOrganizations
     Author:  Chris Carson
    Purpose:  Expanded view of dbo.Organizations for mergeOrganizations process

    revisor     date          description
    ---------   -----------   ----------------------------
    ccarson     2012-09-17    Created


    Notes:

************************************************************************************************************************************
*/
AS

      WITH  orgTypes AS ( 
            SELECT  s.id
                 ,  s.systemName
                 ,  OrganizationTypeID = h.id
                 ,  OrgType            = h.typename
              FROM  dbo.transitionSystems AS s
       CROSS APPLY  Reference.tvf_OrganizationTypes ( systemname ) AS h ) , 

            verticals AS ( 
            SELECT  s.id
                 ,  s.systemName
                 ,  VerticalID = h.id
                 ,  Vertical   = h.verticalName
              FROM  dbo.transitionSystems AS s
       CROSS APPLY  Reference.tvf_Verticals ( systemname ) AS h )

    SELECT  TOP 100 PERCENT
            o.id
          , Name
          , Website
          , Status
          , Summary
          , isActive
          , isDemo
          , isTemp
          , brandID
          , orgCreatedOn    = o.CreatedOn
          , orgCreatedBy    = o.CreatedBy
          , orgUpdatedOn    = o.UpdatedOn
          , orgUpdatedBy    = o.UpdatedBy
          , portal          = COALESCE(s.systemName,'No Portals')
          , OrgTypeID       = COALESCE(os.organizationTypeID, 0)
          , OrgType         = COALESCE(ot.OrgType, 'NONE')
          , VerticalID      = COALESCE(os.verticalID,0)
          , Vertical        = COALESCE(v.Vertical, 'NONE')
          , PortalCreatedOn = os.createdOn
          , PortalCreatedBy = os.createdBy
          , PortalUpdatedOn = os.updatedOn
          , PortalUpdatedBy = os.updatedBy
          , mc_organizationID 
      FROM  dbo.Organizations o
 LEFT JOIN  dbo.organizationsystems AS os ON o.id = os.id
 LEFT JOIN  dbo.transitionSystems AS s ON s.id = os.systemID
 LEFT JOIN  orgTypes AS ot ON ot.id = os.systemID AND ot.OrganizationTypeID = os.OrganizationTypeID
 LEFT JOIN  verticals AS v ON v.id = os.systemID AND v.VerticalID = os.verticalID 
  ORDER BY  Name, portal, mc_organizationID ;

