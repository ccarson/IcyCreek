ALTER TABLE [dbo].[mc_groups]
    ADD CONSTRAINT [DF_mc_groups_Status] DEFAULT (N'') FOR [Status];

