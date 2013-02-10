CREATE TABLE [dbo].[pt_milestones] (
    [milestoneID] NCHAR (35)     NOT NULL,
    [projectID]   NCHAR (35)     NOT NULL,
    [userID]      NCHAR (35)     NOT NULL,
    [forID]       NVARCHAR (35)  NULL,
    [name]        NVARCHAR (50)  NULL,
    [description] NVARCHAR (MAX) NULL,
    [dueDate]     DATETIME2 (0)  NULL,
    [completed]   DATETIME2 (0)  NULL,
    [rate]        DECIMAL (8, 2) NULL,
    [billed]      INT            NULL,
    [paid]        INT            NULL
);

