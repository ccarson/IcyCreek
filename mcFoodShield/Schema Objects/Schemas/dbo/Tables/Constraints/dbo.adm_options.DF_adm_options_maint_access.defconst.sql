ALTER TABLE [dbo].[adm_options]
    ADD CONSTRAINT [DF_adm_options_maint_access] DEFAULT (N'') FOR [maint_access];

