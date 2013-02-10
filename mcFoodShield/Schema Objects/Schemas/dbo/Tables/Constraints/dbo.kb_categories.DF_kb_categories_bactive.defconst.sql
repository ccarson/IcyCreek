ALTER TABLE [dbo].[kb_categories]
    ADD CONSTRAINT [DF_kb_categories_bactive] DEFAULT ((1)) FOR [bactive];

