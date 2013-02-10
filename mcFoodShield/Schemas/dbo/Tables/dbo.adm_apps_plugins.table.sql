CREATE TABLE [dbo].[adm_apps_plugins] (
    [id]           INT            IDENTITY (1, 1) NOT NULL,
    [sPlugin_name] NVARCHAR (100) NOT NULL,
    [iApp_id]      INT            NOT NULL,
    [bActive]      BIT            NOT NULL,
    [bVersion]     INT            NOT NULL,
    [sConfigPath]  NVARCHAR (255) NULL,
    [sDescription] NVARCHAR (255) NULL
);

