ALTER TABLE [dbo].[update_alerts]
    ADD CONSTRAINT [DF_update_alerts_update_DefectID] DEFAULT (NULL) FOR [update_DefectID];

