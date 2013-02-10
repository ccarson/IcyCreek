ALTER TABLE [dbo].[security_assets]
    ADD CONSTRAINT [DF_security_assets_asset_display] DEFAULT (N'') FOR [asset_display];

