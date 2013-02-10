CREATE VIEW dbo.mc_contact_orgroles
/*
************************************************************************************************************************************

       View:    dbo.mc_contact_orgroles
     Author:    Chris Carson
       Date:    2012-09-01

    revisor    Version  date            description
    ---------  -------  -----------     ----------------------------
    ccarson    1.0      2012-09-01      Created

    portal view of data from coreSHIELD.dbo.ContactOrgRoles and coreSHIELD.dbo.transitionIdentities


************************************************************************************************************************************
*/
AS
    SELECT  id             = t.ContactOrgRolesID
          , user_id        = tc1.ContactsID
          , org_id         = o.OrganizationsID
          , dept_id        = COALESCE( d.OrgDepartmentsID, 0 )
          , role_id        = r.RolesID
          , is_head        = isHead
          , date_added     = dateAdded
          , added_by       = COALESCE( tc2.ContactsID, 0 )
          , date_modified  = dateUpdated
          , modified_by    = COALESCE( tc3.ContactsID, 0 )
      FROM  dbo.ContactOrgRoles AS cor
INNER JOIN  dbo.vw_transitionContactOrgRoles AS t
        ON  t.id = cor.id
            AND t.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems
                                           WHERE systemName = db_name() )
INNER JOIN  dbo.vw_transitionContacts AS tc1
        ON  tc1.id = cor.ContactsID
            AND tc1.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems
                                             WHERE systemName = db_name() )
INNER JOIN  dbo.vw_transitionOrganizations AS o
        ON  o.id = cor.organizationsID
            AND o.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems
                                           WHERE systemName = db_name() )
INNER JOIN  dbo.vw_transitionRoles AS r
        ON  r.id = cor.RolesID
            AND r.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems
                                           WHERE systemName = db_name() )
 LEFT JOIN  dbo.vw_transitionContacts AS tc2
        ON  tc2.id = cor.addedBy
            AND tc2.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems
                                             WHERE systemName = db_name() )
 LEFT JOIN  dbo.vw_transitionContacts AS tc3
        ON  tc3.id = cor.updatedBy
            AND tc3.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems
                                             WHERE systemName = db_name() )
 LEFT JOIN  dbo.vw_transitionOrgDepartments AS d
        ON  cor.OrgDepartmentsID = d.id
            AND d.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems
                                           WHERE systemName = db_name() ) ;

