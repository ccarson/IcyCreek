CREATE TABLE [dbo].[galleon_subscriptions] (
    [id]             NVARCHAR (35) NOT NULL,
    [useridfk]       NVARCHAR (35) NOT NULL,
    [threadidfk]     NVARCHAR (35) NULL,
    [forumidfk]      NVARCHAR (35) NULL,
    [conferenceidfk] NVARCHAR (35) NULL
);

