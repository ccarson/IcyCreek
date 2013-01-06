ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_Group_Name] DEFAULT (N'') FOR [Group_Name];

