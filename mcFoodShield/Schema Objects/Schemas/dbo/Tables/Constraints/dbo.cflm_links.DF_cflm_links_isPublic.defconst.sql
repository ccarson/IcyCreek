ALTER TABLE [dbo].[cflm_links]
    ADD CONSTRAINT [DF_cflm_links_isPublic] DEFAULT ((1)) FOR [isPublic];

