ALTER TABLE [dbo].[security_matrix]
    ADD CONSTRAINT [DF_security_matrix_asset_id] DEFAULT ('0') FOR [asset_id];

