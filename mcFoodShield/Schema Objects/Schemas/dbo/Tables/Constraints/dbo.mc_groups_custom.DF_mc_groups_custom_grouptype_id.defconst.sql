ALTER TABLE [dbo].[mc_groups_custom]
    ADD CONSTRAINT [DF_mc_groups_custom_grouptype_id] DEFAULT ((0)) FOR [grouptype_id];

