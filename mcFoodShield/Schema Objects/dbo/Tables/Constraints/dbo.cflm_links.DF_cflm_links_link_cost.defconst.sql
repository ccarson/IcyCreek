ALTER TABLE [dbo].[cflm_links]
    ADD CONSTRAINT [DF_cflm_links_link_cost] DEFAULT ('0') FOR [link_cost];

