ALTER TABLE [dbo].[mc_groupmembers]
    ADD CONSTRAINT [DF_mc_groupmembers_GroupID] DEFAULT ('0') FOR [GroupID];

