ALTER TABLE [dbo].[mc_groups_specialroles]
    ADD CONSTRAINT [DF_mc_groups_specialroles_iGroup_ID] DEFAULT ('0') FOR [iGroup_ID];

