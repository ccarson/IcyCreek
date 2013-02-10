ALTER TABLE [dbo].[adm_apps]
    ADD CONSTRAINT [DF_adm_apps_appid] DEFAULT ((0)) FOR [appid];

