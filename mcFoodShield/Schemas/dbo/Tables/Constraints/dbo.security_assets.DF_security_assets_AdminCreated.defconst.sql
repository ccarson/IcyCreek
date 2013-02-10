ALTER TABLE [dbo].[security_assets]
    ADD CONSTRAINT [DF_security_assets_AdminCreated] DEFAULT ('0') FOR [AdminCreated];

