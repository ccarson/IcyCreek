ALTER TABLE [dbo].[smeUsers]
    ADD CONSTRAINT [fk_agentRecordID2] FOREIGN KEY ([recordID]) REFERENCES [dbo].[smeRecords] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

