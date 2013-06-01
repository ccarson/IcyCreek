ALTER TABLE [dbo].[cflm_links]
    ADD CONSTRAINT [DF_cflm_links_link_author] DEFAULT ('0') FOR [link_author];

