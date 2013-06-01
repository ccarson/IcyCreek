CREATE TABLE [dbo].[pt_messages] (
    [messageID]     NCHAR (35)     NOT NULL,
    [projectID]     NCHAR (35)     NOT NULL,
    [milestoneID]   NVARCHAR (35)  NULL,
    [userID]        NCHAR (35)     NOT NULL,
    [title]         NVARCHAR (120) NULL,
    [message]       NVARCHAR (MAX) NULL,
    [categoryID]    NCHAR (35)     NOT NULL,
    [allowcomments] BIT            NULL,
    [stamp]         DATETIME2 (0)  NULL
);

