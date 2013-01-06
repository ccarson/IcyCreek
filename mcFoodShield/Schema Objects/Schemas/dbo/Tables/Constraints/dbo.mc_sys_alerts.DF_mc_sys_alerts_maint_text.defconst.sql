ALTER TABLE [dbo].[mc_sys_alerts]
    ADD CONSTRAINT [DF_mc_sys_alerts_maint_text] DEFAULT (NULL) FOR [maint_text];

