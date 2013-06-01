ALTER TABLE [dbo].[cflm_links]
    ADD CONSTRAINT [DF_cflm_links_link_version] DEFAULT (NULL) FOR [link_version];

