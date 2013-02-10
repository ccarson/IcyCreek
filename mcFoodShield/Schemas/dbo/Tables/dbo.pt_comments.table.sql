CREATE TABLE [dbo].[pt_comments] (
    [commentID]   NCHAR (35)     NOT NULL,
    [projectID]   NCHAR (35)     NOT NULL,
    [type]        NVARCHAR (6)   NULL,
    [itemID]      NCHAR (35)     NULL,
    [userID]      NCHAR (35)     NOT NULL,
    [commentText] NVARCHAR (MAX) NULL,
    [stamp]       DATETIME2 (0)  NULL
);

