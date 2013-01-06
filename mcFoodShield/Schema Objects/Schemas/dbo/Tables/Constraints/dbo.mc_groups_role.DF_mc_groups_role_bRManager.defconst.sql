ALTER TABLE [dbo].[mc_groups_role]
    ADD CONSTRAINT [DF_mc_groups_role_bRManager] DEFAULT ((0)) FOR [bRManager];

