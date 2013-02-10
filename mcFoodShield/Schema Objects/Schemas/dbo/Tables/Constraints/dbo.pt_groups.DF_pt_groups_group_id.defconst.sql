ALTER TABLE [dbo].[pt_groups]
    ADD CONSTRAINT [DF_pt_groups_group_id] DEFAULT ((0)) FOR [group_id];

