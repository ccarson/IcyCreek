ALTER TABLE [dbo].[adm_apps]
    ADD CONSTRAINT [DF_adm_apps_customtype] DEFAULT ((0)) FOR [customtype];

