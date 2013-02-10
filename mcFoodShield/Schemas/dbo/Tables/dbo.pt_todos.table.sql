CREATE TABLE [dbo].[pt_todos] (
    [todoID]     NCHAR (35)     NOT NULL,
    [todolistID] NCHAR (35)     NOT NULL,
    [projectID]  NCHAR (35)     NOT NULL,
    [userID]     NCHAR (35)     NOT NULL,
    [task]       NVARCHAR (600) NULL,
    [rank]       INT            NULL,
    [added]      DATETIME2 (0)  NULL,
    [due]        DATETIME2 (0)  NULL,
    [completed]  DATETIME2 (0)  NULL
);

