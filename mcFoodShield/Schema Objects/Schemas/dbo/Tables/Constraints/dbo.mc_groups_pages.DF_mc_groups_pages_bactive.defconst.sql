ALTER TABLE [dbo].[mc_groups_pages]
    ADD CONSTRAINT [DF_mc_groups_pages_bactive] DEFAULT ((0)) FOR [bactive];

