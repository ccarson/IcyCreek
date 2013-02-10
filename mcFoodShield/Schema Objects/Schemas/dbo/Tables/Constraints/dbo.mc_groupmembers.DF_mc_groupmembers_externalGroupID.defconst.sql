ALTER TABLE [dbo].[mc_groupmembers]
    ADD CONSTRAINT [DF_mc_groupmembers_externalGroupID] DEFAULT ('0') FOR [externalGroupID];

