ALTER TABLE [dbo].[adm_apps_plugins]
    ADD CONSTRAINT [DF_adm_apps_plugins_sConfigPath] DEFAULT (NULL) FOR [sConfigPath];

