ALTER TABLE [dbo].[Responses]
    ADD CONSTRAINT [FK_Responses_Reports] FOREIGN KEY ([reportsID]) REFERENCES [dbo].[Reports] ([reportsID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

