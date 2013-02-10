CREATE TABLE [dbo].[pt_activity] (
    [activityID] NCHAR (35)     NOT NULL,
    [projectID]  NCHAR (35)     NOT NULL,
    [userID]     NCHAR (35)     NOT NULL,
    [type]       NVARCHAR (12)  NULL,
    [id]         NCHAR (35)     NOT NULL,
    [name]       NVARCHAR (100) NULL,
    [activity]   NVARCHAR (50)  NULL,
    [stamp]      DATETIME2 (0)  NULL
);

