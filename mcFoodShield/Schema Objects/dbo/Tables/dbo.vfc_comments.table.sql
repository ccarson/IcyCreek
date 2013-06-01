CREATE TABLE [dbo].[vfc_comments] (
    [CommentID]   INT            IDENTITY (24, 1) NOT NULL,
    [FileID]      INT            NOT NULL,
    [CommentDate] DATETIME2 (0)  NULL,
    [Comments]    NVARCHAR (MAX) NULL,
    [userID]      INT            NOT NULL
);

