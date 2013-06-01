CREATE TABLE [dbo].[galleon_threads] (
    [Id]               VARCHAR (35)  NOT NULL,
    [name]             VARCHAR (255) NOT NULL,
    [active]           TINYINT       NOT NULL,
    [useridfk]         VARCHAR (35)  NOT NULL,
    [forumidfk]        VARCHAR (35)  NOT NULL,
    [datecreated]      DATETIME      NOT NULL,
    [sticky]           TINYINT       NOT NULL,
    [messages]         INT           NULL,
    [lastpostuseridfk] VARCHAR (35)  NULL,
    [lastpostcreated]  DATETIME      NULL
);

