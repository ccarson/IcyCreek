ALTER TABLE [dbo].[mc_groups_role]
    ADD CONSTRAINT [DF_mc_groups_role_sort_order] DEFAULT ('0') FOR [sort_order];

