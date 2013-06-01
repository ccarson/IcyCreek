ALTER TABLE [dbo].[adm_apps]
    ADD CONSTRAINT [DF_adm_apps_active] DEFAULT ((0)) FOR [active];

