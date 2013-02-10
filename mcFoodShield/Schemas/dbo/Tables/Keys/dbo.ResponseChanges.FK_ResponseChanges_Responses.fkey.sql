ALTER TABLE [dbo].[ResponseChanges]
    ADD CONSTRAINT [FK_ResponseChanges_Responses] FOREIGN KEY ([responsesID]) REFERENCES [dbo].[Responses] ([responsesID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

