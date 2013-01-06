ALTER TABLE [dbo].[mc_groupmember_meetings]
    ADD CONSTRAINT [DF_mc_groupmember_meetings_user_id] DEFAULT ('0') FOR [user_id];

