CREATE PROCEDURE dbo.getUserRootFolders ( 
	@userID AS INT 
	, @folderType AS INT = NULL
	, @groupID AS INT = NULL ) AS

BEGIN

	DECLARE @type AS NVARCHAR(50) = NULL ;

    SET NOCOUNT ON ;

    CREATE TABLE #Children (
         folderID INT
        ,parentID INT
        ,rowNum INT
        ,sharingFrom BIT
        ,sharedTo BIT ) ;

    CREATE CLUSTERED INDEX tmpind ON #Children( folderID, parentID ) ;

    INSERT  INTO #Children ( folderID, parentID, rowNum, sharingFrom, sharedTo )
    SELECT  id, ParentFolderID
            , ROW_NUMBER() OVER ( PARTITION BY parentFolderID ORDER BY parentFolderID ), 0, 0
    FROM    dbo.vfc_folder 
    WHERE   bActive = 1 AND foldertype IN (1,2) 
	UNION ALL    
    SELECT  id, ParentFolderID
            , ROW_NUMBER() OVER ( PARTITION BY parentFolderID ORDER BY parentFolderID ), 0, 0
    FROM    dbo.vfc_folder 
    WHERE   bActive = 1 AND foldertype = 3 AND user_id = @userID
	UNION ALL    
    SELECT  f.id, f.ParentFolderID
			, ROW_NUMBER() OVER ( PARTITION BY parentFolderID ORDER BY parentFolderID ), 0, 0
    FROM    dbo.vfc_folder AS f
    INNER JOIN dbo.mc_groupmembers AS mcg 
		ON f.group_id = mcg.GroupID AND 
			mcg.ForeignKeyID = @userID AND f.bactive = 1 AND f.FolderType = 4
	UNION
    SELECT  0, NULL, 1 , 0, 0 ;
    
    IF ( @groupID IS NULL )
	    INSERT  INTO #Children ( folderID, parentID, rowNum, sharingFrom, sharedTo )
		SELECT DISTINCT f.id, f.ParentFolderID
				, 1, 0, 0
		FROM dbo.vfc_folder AS f
		INNER JOIN dbo.vfc_folderace AS ace ON ace.FolderID = f.id
		INNER JOIN dbo.mc_groupmembers AS mcg ON mcg.GroupID = f.group_id
		WHERE mcg.ForeignKeyID = 5 AND
			f.bActive = 1 AND f.FolderType = 5 ;
	ELSE    
	    INSERT  INTO #Children ( folderID, parentID, rowNum, sharingFrom, sharedTo )
		SELECT  f.id, f.ParentFolderID, 1, 0, 1
		FROM dbo.vfc_folder AS f
		INNER JOIN dbo.vfc_folderace AS ace 
			ON ace.FolderID = f.id AND ace.UserGroupID = f.group_id 
		INNER JOIN dbo.mc_groupmembers AS mcg 
			ON mcg.ForeignKeyID = @userID AND mcg.GroupID = f.group_id AND mcg.GroupID = @groupID
		WHERE f.bActive = 1 AND f.FolderType = 5
		
		UNION ALL   
		SELECT  f.id, f.ParentFolderID, 1, 1, 0
		FROM dbo.vfc_folder AS f
		INNER JOIN dbo.vfc_folderace AS ace 
			ON ace.FolderID = f.id AND ace.UserGroupID <> f.group_id AND ace.UserGroupID = @groupID
		INNER JOIN dbo.mc_groupmembers AS mcg 
			ON mcg.GroupID = ace.UserGroupID AND mcg.ForeignKeyID = @userID
		WHERE f.bActive = 1 AND f.FolderType = 5 ;

    WITH paths ( path, folderID, sharingFrom, sharedTo ) 
    AS ( 
		SELECT   HIERARCHYID::GetRoot() AS node
					, folderID, sharingFrom, sharedTo
		FROM     #Children AS c
		WHERE    parentID IS NULL
		UNION ALL
		SELECT   CAST(p.path.ToString() + CAST(c.rowNum AS VARCHAR(30)) + '/' AS HIERARCHYID)
					, c.folderID, c.sharingFrom, c.sharedTo
		FROM     #Children AS c
		INNER JOIN paths AS p ON c.parentID = p.folderID )

    SELECT  CASE 
				WHEN f.foldertype = 5 AND sharingFrom = 1 THEN N'Shared Folders In'
				WHEN f.foldertype = 5 AND sharedTo = 1 THEN N'Shared Folders Out'
				WHEN f.foldertype = 5 AND @groupID IS NULL THEN N'Shared Folders'
				WHEN f.foldertype = 4 THEN N'My Workgroups'
				WHEN f.foldertype = 3 THEN N'My Personal'
				ELSE N'General Library'
			END AS [type] ,
			CASE 
				WHEN f.foldertype = 5 AND sharingFrom = 1 THEN 5
				WHEN f.foldertype = 5 AND sharedTo = 1 THEN 6
				WHEN f.foldertype = 5 AND @groupID IS NULL THEN 5
				WHEN f.foldertype = 4 THEN 1
				WHEN f.foldertype = 3 THEN 2
				ELSE 3
			END AS listOrder,
			COALESCE(g.Group_Name, N'') AS groupName, f.sName AS folderName
				, p.folderID, f.group_id AS groupID
				, CASE
						WHEN f.foldertype = 5 THEN 0
						ELSE path.GetLevel() - 1 
				  END AS folderDepth
				, path, sharingFrom, sharedTo
	INTO #folderList
    FROM    paths AS p
	INNER JOIN dbo.vfc_folder AS f ON p.folderID = f.id
	LEFT OUTER JOIN dbo.mc_groups AS g ON g.Group_ID = f.group_id ;
	
	SET @type = ( 
		SELECT CASE	
					WHEN @folderType = 1 THEN N'My Workgroups'
					WHEN @folderType = 2 THEN N'My Personal'
					WHEN @folderType = 3 THEN N'General Library'
					WHEN @folderType = 5 AND @groupID IS NULL THEN N'Shared Folders'
					WHEN @folderType = 5 THEN N'Shared Folders In'
					WHEN @folderType = 6 AND @groupID IS NULL THEN N'Shared Folders'
					WHEN @folderType = 6 THEN N'Shared Folders Out'
					ELSE NULL
				END ) ;
				
	SELECT type, groupName, folderName AS sName, folderID AS id, groupID, COUNT(f.id) AS fileCount
	FROM #folderList AS fl
	LEFT OUTER JOIN dbo.vfc_file AS f ON f.ParentFolderID = fl.folderID
	WHERE folderDepth = 0 AND ISNULL(@type, type) = type
	GROUP BY type, groupName, folderName, folderID, groupID, listOrder, path
	ORDER BY fl.listOrder, fl.folderName, fl.path ;
	
	
	--SELECT fl.folderID, f.* 
	--FROM dbo.vfc_file AS f
	--INNER JOIN #folderList AS fl ON fl.folderID = f.ParentFolderID 
	--ORDER BY fl.groupID, f.sName

END