ALTER TABLE [dbo].[mc_groups_custom]
    ADD CONSTRAINT [DF_mc_groups_custom_core_id] DEFAULT ((0)) FOR [core_id];

