CREATE TABLE [dbo].[adm_apps] (
    [id]           INT             IDENTITY (48, 1) NOT NULL,
    [appname]      NVARCHAR (25)   NOT NULL,
    [active]       BIT             NOT NULL,
    [group_id]     INT             NOT NULL,
    [PIN]          BIT             NOT NULL,
    [customtype]   INT             NOT NULL,
    [appType]      INT             NOT NULL,
    [iVersion]     DECIMAL (11, 2) NOT NULL,
    [sVersionNote] NVARCHAR (50)   NULL,
    [bReleased]    BIT             NOT NULL,
    [bMaintenance] BIT             NOT NULL,
    [sDescription] NVARCHAR (255)  NULL,
    [sConfigPath]  NVARCHAR (255)  NULL,
    [appid]        INT             NOT NULL
);

