ALTER TABLE [dbo].[adm_apps_type]
    ADD CONSTRAINT [DF_adm_apps_type_typename] DEFAULT (N'') FOR [typename];

