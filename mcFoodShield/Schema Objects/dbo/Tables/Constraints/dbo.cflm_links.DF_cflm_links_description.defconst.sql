ALTER TABLE [dbo].[cflm_links]
    ADD CONSTRAINT [DF_cflm_links_description] DEFAULT (NULL) FOR [description];

