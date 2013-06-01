CREATE VIEW dbo.mc_roles_relation AS SELECT trc.RolesRoleCategoriesID AS id, tr.RolesID as role_id, tc.RoleCategoriesID as category_id
			FROM dbo.RolesRoleCategories AS rrc
			INNER JOIN dbo.vw_transitionRolesRoleCategories AS trc ON trc.id = rrc.id
				AND trc.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = db_name() )	 
			INNER JOIN dbo.vw_transitionRoles AS tr ON tr.id = rrc.RolesID
				AND tr.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = db_name() )	
			INNER JOIN dbo.vw_transitionRoleCategories AS tc ON tc.id = rrc.RoleCategoriesID 
				AND tc.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = db_name() )