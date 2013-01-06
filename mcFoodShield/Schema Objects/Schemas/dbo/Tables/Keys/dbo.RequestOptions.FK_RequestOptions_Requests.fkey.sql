ALTER TABLE [dbo].[RequestOptions]
    ADD CONSTRAINT [FK_RequestOptions_Requests] FOREIGN KEY ([requestsID]) REFERENCES [dbo].[Requests] ([requestsID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

