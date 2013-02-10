ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_terms] DEFAULT ((0)) FOR [terms];

