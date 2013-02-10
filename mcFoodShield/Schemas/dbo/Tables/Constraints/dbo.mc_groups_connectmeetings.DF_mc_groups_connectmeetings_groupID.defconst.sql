ALTER TABLE [dbo].[mc_groups_connectmeetings]
    ADD CONSTRAINT [DF_mc_groups_connectmeetings_groupID] DEFAULT ('0') FOR [groupID];

