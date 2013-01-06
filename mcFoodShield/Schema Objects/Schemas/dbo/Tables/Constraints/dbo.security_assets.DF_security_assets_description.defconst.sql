ALTER TABLE [dbo].[security_assets]
    ADD CONSTRAINT [DF_security_assets_description] DEFAULT (N'') FOR [description];

