CREATE TABLE [dbo].[pt_todolists] (
    [todolistID]  NCHAR (35)     NOT NULL,
    [projectID]   NCHAR (35)     NOT NULL,
    [title]       NVARCHAR (100) NULL,
    [description] NVARCHAR (MAX) NULL,
    [milestoneID] NVARCHAR (35)  NULL,
    [userID]      NCHAR (35)     NOT NULL,
    [added]       DATETIME2 (0)  NULL,
    [rank]        BIT            NULL,
    [timetrack]   INT            NULL
);

