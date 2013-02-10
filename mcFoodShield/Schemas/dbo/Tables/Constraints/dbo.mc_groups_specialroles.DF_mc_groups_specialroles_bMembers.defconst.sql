ALTER TABLE [dbo].[mc_groups_specialroles]
    ADD CONSTRAINT [DF_mc_groups_specialroles_bMembers] DEFAULT ((0)) FOR [bMembers];

