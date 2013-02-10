ALTER TABLE [dbo].[ResponseGroups]
    ADD CONSTRAINT [FK_ReponseGroups_Responses] FOREIGN KEY ([responsesID]) REFERENCES [dbo].[Responses] ([responsesID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

