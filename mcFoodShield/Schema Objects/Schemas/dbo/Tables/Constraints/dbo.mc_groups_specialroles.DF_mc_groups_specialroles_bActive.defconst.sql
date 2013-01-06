ALTER TABLE [dbo].[mc_groups_specialroles]
    ADD CONSTRAINT [DF_mc_groups_specialroles_bActive] DEFAULT ((1)) FOR [bActive];

