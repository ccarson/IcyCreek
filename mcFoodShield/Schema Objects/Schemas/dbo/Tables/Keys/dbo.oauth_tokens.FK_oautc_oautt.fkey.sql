ALTER TABLE [dbo].[oauth_tokens]
    ADD CONSTRAINT [FK_oautc_oautt] FOREIGN KEY ([consumer_ID]) REFERENCES [dbo].[oauth_consumers] ([consumer_ID]) ON DELETE CASCADE ON UPDATE CASCADE;

