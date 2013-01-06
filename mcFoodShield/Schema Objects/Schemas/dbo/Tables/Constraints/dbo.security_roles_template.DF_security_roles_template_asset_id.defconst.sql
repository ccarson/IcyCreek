ALTER TABLE [dbo].[security_roles_template]
    ADD CONSTRAINT [DF_security_roles_template_asset_id] DEFAULT ('0') FOR [asset_id];

