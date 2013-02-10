CREATE TABLE [dbo].[mc_groups_blog] (
    [id]          INT            IDENTITY (1, 1) NOT NULL,
    [groupID]     INT            NOT NULL,
    [groupNewsID] INT            NULL,
    [userID]      INT            NOT NULL,
    [dateCreated] DATETIME       NULL,
    [dateRemoved] DATE           NULL,
    [subject]     NVARCHAR (50)  NULL,
    [description] NVARCHAR (250) NULL,
    [isActive]    BIT            NULL,
    [threadID]    INT            NULL,
    [lastUpdated] TIMESTAMP      NULL
);

