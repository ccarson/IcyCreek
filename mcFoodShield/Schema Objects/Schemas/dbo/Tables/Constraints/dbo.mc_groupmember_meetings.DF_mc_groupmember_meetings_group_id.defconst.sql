ALTER TABLE [dbo].[mc_groupmember_meetings]
    ADD CONSTRAINT [DF_mc_groupmember_meetings_group_id] DEFAULT ('0') FOR [group_id];

