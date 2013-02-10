ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_forum] DEFAULT (N'') FOR [forum];

