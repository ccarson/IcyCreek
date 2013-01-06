ALTER TABLE [dbo].[alert_maintenance]
    ADD CONSTRAINT [DF_alert_maintenance_alert_SmDesc] DEFAULT (NULL) FOR [alert_SmDesc];

