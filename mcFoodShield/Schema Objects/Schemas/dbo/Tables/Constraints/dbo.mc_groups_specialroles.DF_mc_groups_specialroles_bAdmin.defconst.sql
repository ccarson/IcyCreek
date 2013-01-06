ALTER TABLE [dbo].[mc_groups_specialroles]
    ADD CONSTRAINT [DF_mc_groups_specialroles_bAdmin] DEFAULT ((0)) FOR [bAdmin];

