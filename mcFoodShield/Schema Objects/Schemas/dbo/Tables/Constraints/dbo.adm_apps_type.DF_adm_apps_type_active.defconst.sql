ALTER TABLE [dbo].[adm_apps_type]
    ADD CONSTRAINT [DF_adm_apps_type_active] DEFAULT ((0)) FOR [active];

