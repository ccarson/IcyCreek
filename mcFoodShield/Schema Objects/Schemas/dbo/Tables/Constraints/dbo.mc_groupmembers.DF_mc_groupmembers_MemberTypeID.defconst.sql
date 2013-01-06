ALTER TABLE [dbo].[mc_groupmembers]
    ADD CONSTRAINT [DF_mc_groupmembers_MemberTypeID] DEFAULT ('0') FOR [MemberTypeID];

