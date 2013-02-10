ALTER TABLE [dbo].[security_assets]
    ADD CONSTRAINT [DF_security_assets_group_id] DEFAULT ('0') FOR [group_id];

