ALTER TABLE [dbo].[cflm_links]
    ADD CONSTRAINT [DF_cflm_links_author_notified] DEFAULT ((0)) FOR [author_notified];

