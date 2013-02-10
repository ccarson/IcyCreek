CREATE TABLE [dbo].[oauth_consumers] (
    [consumer_ID] INT           NOT NULL,
    [editor_ID]   INT           NOT NULL,
    [name]        NVARCHAR (20) NOT NULL,
    [fullname]    NVARCHAR (50) NOT NULL,
    [email]       NVARCHAR (50) NOT NULL,
    [ckey]        NVARCHAR (50) NOT NULL,
    [csecret]     NVARCHAR (50) NOT NULL,
    [datecreated] DATETIME      NOT NULL
);

