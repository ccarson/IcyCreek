CREATE TABLE [dbo].[oauth_tokens] (
    [tkey]        NVARCHAR (50) NOT NULL,
    [consumer_ID] INT           NOT NULL,
    [type]        VARCHAR (10)  NULL,
    [tsecret]     NVARCHAR (50) NULL,
    [nonce]       NVARCHAR (50) NULL,
    [time_stamp]  DATETIME      NULL
);

