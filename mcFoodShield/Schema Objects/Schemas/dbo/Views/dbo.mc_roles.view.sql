CREATE VIEW dbo.mc_roles AS SELECT r.RoleTitle, r.isActive AS Active, COALESCE( t2.RolesID, 0 ) AS parentid
				, t1.RolesID AS id, 0 AS category_id, r.statepage_include
			FROM dbo.Roles AS r
			INNER JOIN dbo.vw_transitionRoles AS t1 ON t1.id = r.id 
				AND t1.transitionSystemsID  = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = db_name() )	
			LEFT OUTER JOIN dbo.vw_transitionRoles AS t2 ON t2.id = r.parentRolesID
				AND t2.transitionSystemsID  = ( SELECT id FROM dbo.transitionSystems 
												WHERE systemName = db_name() )