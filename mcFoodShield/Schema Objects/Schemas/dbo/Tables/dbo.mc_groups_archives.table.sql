CREATE TABLE [dbo].[mc_groups_archives] (
    [id]          INT           IDENTITY (379, 1) NOT NULL,
    [group_id]    INT           NOT NULL,
    [message_id]  INT           NOT NULL,
    [dateCreated] DATETIME2 (0) NOT NULL,
    [sMessage]    VARCHAR (MAX) NULL,
    [user_id]     INT           NOT NULL,
    [sSubject]    VARCHAR (100) NULL
);

