CREATE TABLE [dbo].[pt_svn_link] (
    [linkID]    NCHAR (35)    NOT NULL,
    [projectID] NCHAR (35)    NULL,
    [revision]  INT           NULL,
    [itemID]    NCHAR (35)    NULL,
    [itemType]  NVARCHAR (10) NULL
);

