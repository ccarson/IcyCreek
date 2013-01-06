ALTER TABLE [dbo].[cw_pages]
    ADD CONSTRAINT [DF_cw_pages_version] DEFAULT ('0') FOR [version];

