ALTER TABLE [dbo].[cflm_links]
    ADD CONSTRAINT [DF_cflm_links_link_hits] DEFAULT ('0') FOR [link_hits];

