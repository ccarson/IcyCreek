CREATE PROCEDURE [dbo].[getUserFolders]  ( @userID AS INT ) AS

BEGIN

    SET NOCOUNT ON ;
    
    CREATE TABLE #Children (
         folderID INT
        ,parentID INT
        ,rowNum INT ) ;

    CREATE CLUSTERED INDEX tmpind ON #Children( folderID, parentID ) ;

	CREATE TABLE #folderList (
		[type]	NVARCHAR(50)
		, listOrder		INT
		, groupName		NVARCHAR(100)
		, folderName	NVARCHAR(100)
		, folderID		INT
		, groupID		INT
		, folderDepth	INT
		, [path]		HIERARCHYID	
		, isParent		BIT ) ;


    INSERT  INTO #Children ( folderID, parentID, rowNum )
    SELECT  id, ParentFolderID
            , ROW_NUMBER() OVER ( PARTITION BY parentFolderID ORDER BY parentFolderID )
    FROM    dbo.vfc_folder 
    WHERE   bActive = 1 AND foldertype IN (1,2) 
	UNION ALL    
    SELECT  id, ParentFolderID
            , ROW_NUMBER() OVER ( PARTITION BY parentFolderID ORDER BY parentFolderID )
    FROM    dbo.vfc_folder 
    WHERE   bActive = 1 AND foldertype = 3 AND user_id = @userID
	UNION ALL    
    SELECT  f.id, f.ParentFolderID
			, ROW_NUMBER() OVER ( PARTITION BY parentFolderID ORDER BY parentFolderID )
    FROM    dbo.vfc_folder AS f
    INNER JOIN dbo.mc_groupmembers AS mcg 
		ON f.group_id = mcg.GroupID AND 
			mcg.ForeignKeyID = @userID AND f.bactive = 1 AND f.FolderType = 4
    UNION
    SELECT  0, NULL, 1 ;


    WITH paths ( path, folderID ) 
    AS ( 
		SELECT   HIERARCHYID::GetRoot() AS node
					, folderID
		FROM     #Children AS c
		WHERE    parentID IS NULL
		UNION ALL
		SELECT   CAST(p.path.ToString() + CAST(c.rowNum AS VARCHAR(30)) + '/' AS HIERARCHYID)
					, c.folderID
		FROM     #Children AS c
		INNER JOIN paths AS p ON c.parentID = p.folderID )

    
    INSERT INTO #folderList
     ( type, listOrder, groupName, folderName, folderID,
                               groupID, folderDepth, path, isParent )
    SELECT  CASE 
				WHEN f.foldertype = 4 THEN N'My Workgroups'
				WHEN f.foldertype = 3 THEN N'My Personal'
				ELSE N'General Library'
			END, 
			CASE 
				WHEN f.foldertype = 4 THEN 1
				WHEN f.foldertype = 3 THEN 2
				ELSE 3
			END, 
				COALESCE(g.Group_Name, N''), f.sName
				, p.folderID, f.group_id
				, path.GetLevel() - 1, path
				, CASE
					WHEN EXISTS (SELECT * FROM vfc_folder WHERE ParentFolderID = p.folderID) THEN 1
					ELSE 0
				  END
    FROM    paths AS p
	INNER JOIN dbo.vfc_folder AS f ON p.folderID = f.id
	LEFT OUTER JOIN dbo.mc_groups AS g ON g.Group_ID = f.group_id ;


	SELECT type, groupName, folderName, folderID, groupID, folderDepth, COUNT(f.id) AS fileCount, isParent
	FROM #folderList AS fl
	LEFT OUTER JOIN dbo.vfc_file AS f ON f.PArentFolderID = fl.folderID
	GROUP BY type, groupName, folderName, folderID, groupID, folderDepth, listOrder, path, isParent
	ORDER BY fl.listOrder, fl.path ;
	
	SELECT fl.folderID, f.* 
	FROM dbo.vfc_file AS f
	INNER JOIN #folderList AS fl ON fl.folderID = f.ParentFolderID 
	ORDER BY 1, f.sName

END

