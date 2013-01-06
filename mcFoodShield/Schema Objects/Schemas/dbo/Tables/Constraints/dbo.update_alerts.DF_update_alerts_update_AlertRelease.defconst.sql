ALTER TABLE [dbo].[update_alerts]
    ADD CONSTRAINT [DF_update_alerts_update_AlertRelease] DEFAULT (NULL) FOR [update_AlertRelease];

