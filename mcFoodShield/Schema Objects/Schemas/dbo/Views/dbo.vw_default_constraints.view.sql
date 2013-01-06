
CREATE view [dbo].[vw_default_constraints] 
AS 


SELECT DB_NAME()			AS CONSTRAINT_CATALOG
	, t_obj.name			AS TABLE_NAME
	, user_name(c_obj.uid)	AS CONSTRAINT_SCHEMA
	, c_obj.name			AS CONSTRAINT_NAME
	, col.name				AS COLUMN_NAME
	, col.colid				AS ORDINAL_POSITION
	, com.text				AS DEFAULT_CLAUSE
FROM		sys.sysobjects		AS c_obj 
INNER JOIN	sys.syscomments		AS com		ON c_obj.id = com.id 
INNER JOIN	sys.sysobjects		AS t_obj	ON c_obj.parent_obj = t_obj.id 
INNER JOIN	sys.sysconstraints	AS con		ON c_obj.id = con.constid 
INNER JOIN	sys.syscolumns		AS col		ON t_obj.id = col.id 
												AND con.colid = col.colid
WHERE 
	c_obj.uid = USER_ID() AND c_obj.xtype = 'D'
