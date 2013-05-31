ALTER TABLE [dbo].[ContactVerifications]
    ADD CONSTRAINT [FK_ContactVerifications_verifiedBy_Contacts] FOREIGN KEY ([verified_by]) REFERENCES [dbo].[Contacts] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
ALTER TABLE [dbo].[ContactVerifications] NOCHECK CONSTRAINT [FK_ContactVerifications_verifiedBy_Contacts];

