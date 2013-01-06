ALTER TABLE [dbo].[pt_categories]
    ADD CONSTRAINT [DF_pt_categories_type] DEFAULT (NULL) FOR [type];

