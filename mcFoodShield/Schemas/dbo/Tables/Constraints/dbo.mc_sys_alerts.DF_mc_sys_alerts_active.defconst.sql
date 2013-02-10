ALTER TABLE [dbo].[mc_sys_alerts]
    ADD CONSTRAINT [DF_mc_sys_alerts_active] DEFAULT ((1)) FOR [active];

