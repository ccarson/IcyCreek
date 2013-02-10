ALTER TABLE [dbo].[update_alerts]
    ADD CONSTRAINT [DF_update_alerts_update_AlertAffected] DEFAULT (NULL) FOR [update_AlertAffected];

