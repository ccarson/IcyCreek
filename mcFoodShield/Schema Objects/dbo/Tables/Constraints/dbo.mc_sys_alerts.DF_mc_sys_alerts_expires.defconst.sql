ALTER TABLE [dbo].[mc_sys_alerts]
    ADD CONSTRAINT [DF_mc_sys_alerts_expires] DEFAULT (NULL) FOR [expires];

