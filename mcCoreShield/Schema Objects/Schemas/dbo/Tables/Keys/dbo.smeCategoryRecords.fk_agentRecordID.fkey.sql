ALTER TABLE [dbo].[smeCategoryRecords]
    ADD CONSTRAINT [fk_agentRecordID] FOREIGN KEY ([RecordID]) REFERENCES [dbo].[smeRecords] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

