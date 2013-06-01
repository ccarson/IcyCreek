ALTER TABLE [dbo].[adm_apps]
    ADD CONSTRAINT [DF_adm_apps_appType] DEFAULT ((0)) FOR [appType];

