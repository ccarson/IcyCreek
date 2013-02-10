ALTER TABLE [dbo].[update_alerts]
    ADD CONSTRAINT [DF_update_alerts_update_AlertDate] DEFAULT (NULL) FOR [update_AlertDate];

