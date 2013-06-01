ALTER TABLE [dbo].[mc_groupmember_meetings]
    ADD CONSTRAINT [DF_mc_groupmember_meetings_meeting_id] DEFAULT ('0') FOR [meeting_id];

