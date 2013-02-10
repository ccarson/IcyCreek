ALTER TABLE [dbo].[adm_apps_options]
    ADD CONSTRAINT [DF_adm_apps_options_active] DEFAULT ((0)) FOR [active];

