ALTER TABLE [dbo].[ContactNotes]
    ADD CONSTRAINT [FK_ContactNotes_Contacts1] FOREIGN KEY ([adminID]) REFERENCES [dbo].[Contacts] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
ALTER TABLE [dbo].[ContactNotes] NOCHECK CONSTRAINT [FK_ContactNotes_Contacts1];

