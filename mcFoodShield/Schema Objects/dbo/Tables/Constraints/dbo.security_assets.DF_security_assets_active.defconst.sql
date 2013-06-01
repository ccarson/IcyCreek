ALTER TABLE [dbo].[security_assets]
    ADD CONSTRAINT [DF_security_assets_active] DEFAULT ((0)) FOR [active];

