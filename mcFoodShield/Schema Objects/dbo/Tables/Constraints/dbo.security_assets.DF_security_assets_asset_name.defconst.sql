ALTER TABLE [dbo].[security_assets]
    ADD CONSTRAINT [DF_security_assets_asset_name] DEFAULT (N'') FOR [asset_name];

