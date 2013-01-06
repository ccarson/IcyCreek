ALTER TABLE [dbo].[pt_categories]
    ADD CONSTRAINT [DF_pt_categories_category] DEFAULT (NULL) FOR [category];

