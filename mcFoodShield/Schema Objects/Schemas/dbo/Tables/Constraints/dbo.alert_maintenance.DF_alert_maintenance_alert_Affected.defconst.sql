ALTER TABLE [dbo].[alert_maintenance]
    ADD CONSTRAINT [DF_alert_maintenance_alert_Affected] DEFAULT (NULL) FOR [alert_Affected];

