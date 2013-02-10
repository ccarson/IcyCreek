ALTER TABLE [dbo].[mc_groupmembers]
    ADD CONSTRAINT [DF_mc_groupmembers_relatedGroupID] DEFAULT ('0') FOR [relatedGroupID];

