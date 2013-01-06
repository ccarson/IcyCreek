CREATE TABLE [dbo].[pt_issues] (
    [issueID]        NCHAR (35)     NOT NULL,
    [projectID]      NCHAR (35)     NOT NULL,
    [milestoneID]    NVARCHAR (35)  NULL,
    [shortID]        NVARCHAR (7)   NULL,
    [issue]          NVARCHAR (120) NULL,
    [detail]         NVARCHAR (MAX) NULL,
    [type]           NVARCHAR (11)  NULL,
    [severity]       NVARCHAR (10)  NULL,
    [status]         NVARCHAR (8)   NULL,
    [relevantURL]    NVARCHAR (255) NULL,
    [created]        DATETIME2 (0)  NULL,
    [createdBy]      NCHAR (35)     NOT NULL,
    [assignedTo]     NVARCHAR (35)  NULL,
    [updated]        DATETIME2 (0)  NULL,
    [updatedBy]      NVARCHAR (35)  NULL,
    [resolution]     NVARCHAR (12)  NULL,
    [resolutionDesc] NVARCHAR (MAX) NULL,
    [componentID]    NVARCHAR (35)  NULL,
    [versionID]      NVARCHAR (35)  NULL,
    [dueDate]        DATETIME2 (0)  NULL
);

