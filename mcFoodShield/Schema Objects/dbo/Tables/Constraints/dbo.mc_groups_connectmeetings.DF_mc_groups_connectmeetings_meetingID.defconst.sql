ALTER TABLE [dbo].[mc_groups_connectmeetings]
    ADD CONSTRAINT [DF_mc_groups_connectmeetings_meetingID] DEFAULT ('0') FOR [meetingID];

