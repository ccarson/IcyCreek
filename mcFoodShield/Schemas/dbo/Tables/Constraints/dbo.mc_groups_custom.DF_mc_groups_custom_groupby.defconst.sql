ALTER TABLE [dbo].[mc_groups_custom]
    ADD CONSTRAINT [DF_mc_groups_custom_groupby] DEFAULT ((0)) FOR [groupby];

