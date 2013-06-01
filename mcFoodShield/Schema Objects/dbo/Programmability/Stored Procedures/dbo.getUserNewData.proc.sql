CREATE PROCEDURE dbo.getUserNewData (
	@userID AS INT )
AS

BEGIN

	SET NOCOUNT ON ; 

	SELECT	groupID, group_Name AS groupName
	INTO	#workgroups
	FROM	dbo.mc_groupmembers AS gm
	INNER JOIN dbo.mc_groups AS g ON g.Group_ID = gm.GroupID
	WHERE ForeignKeyID = @userID ; 

	SELECT N'News' AS recType, id, n.group_id, w.groupName, headline AS subject, dtCreated
	FROM dbo.mc_groups_news AS n
	INNER JOIN #workgroups AS w ON n.group_id = w.groupID
	UNION
	SELECT N'Members', c.id, w.groupID, w.groupName, Firstname + N' ' + Lastname, gm.DateAdded
	FROM dbo.mc_contact AS c
	INNER JOIN dbo.mc_groupmembers AS gm ON gm.ForeignKeyID = c.id
	INNER JOIN #workgroups AS w ON w.groupID = gm.GroupID
	UNION
	SELECT N'Archives', id, group_id, w.groupName, sSubject, dateCreated
	FROM dbo.mc_groups_archives AS a
	INNER JOIN #workgroups AS w ON w.groupID = a.group_id
	UNION
	SELECT N'Meetings', meeting_id, group_id, w.groupName, sMeetingName, dStartDateTime
	FROM dbo.mc_groupmember_meetings AS gm
	INNER JOIN dbo.meetings AS m ON m.id = gm.meeting_id
	INNER JOIN #workgroups AS w ON w.groupID = gm.group_id
	UNION 
	SELECT N'Documents', f.id, fld.group_id, w.groupName, f.sName, f.dtCreated
	FROM dbo.vfc_file AS f
	INNER JOIN dbo.vfc_folder AS fld ON fld.id = f.ParentFolderID
	INNER JOIN #workgroups AS w ON w.groupID = fld.group_id
	ORDER BY 6 DESC ;
	
END

