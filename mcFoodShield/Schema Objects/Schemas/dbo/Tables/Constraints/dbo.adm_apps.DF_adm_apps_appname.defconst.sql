ALTER TABLE [dbo].[adm_apps]
    ADD CONSTRAINT [DF_adm_apps_appname] DEFAULT (N'') FOR [appname];

