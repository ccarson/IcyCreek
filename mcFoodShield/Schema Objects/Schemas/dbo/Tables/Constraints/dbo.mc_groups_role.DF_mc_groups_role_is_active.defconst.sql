ALTER TABLE [dbo].[mc_groups_role]
    ADD CONSTRAINT [DF_mc_groups_role_is_active] DEFAULT ((1)) FOR [is_active];

