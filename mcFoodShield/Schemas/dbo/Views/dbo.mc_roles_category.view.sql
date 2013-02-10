CREATE VIEW dbo.mc_roles_category AS SELECT t.RoleCategoriesID AS id, name AS category_name
			FROM dbo.RoleCategories AS c
			INNER JOIN dbo.vw_transitionRoleCategories AS t ON t.id = c.id 
				AND t.transitionSystemsID = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = db_name() )