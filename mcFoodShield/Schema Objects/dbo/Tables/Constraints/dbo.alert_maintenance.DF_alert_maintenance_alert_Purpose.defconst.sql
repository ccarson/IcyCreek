ALTER TABLE [dbo].[alert_maintenance]
    ADD CONSTRAINT [DF_alert_maintenance_alert_Purpose] DEFAULT (NULL) FOR [alert_Purpose];

