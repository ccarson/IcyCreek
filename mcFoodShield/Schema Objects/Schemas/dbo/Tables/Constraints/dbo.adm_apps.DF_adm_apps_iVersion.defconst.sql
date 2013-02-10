ALTER TABLE [dbo].[adm_apps]
    ADD CONSTRAINT [DF_adm_apps_iVersion] DEFAULT ((0)) FOR [iVersion];

