ALTER TABLE [dbo].[mc_groupmembers]
    ADD CONSTRAINT [DF_mc_groupmembers_Type] DEFAULT (N'') FOR [Type];

