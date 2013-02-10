ALTER TABLE [dbo].[mc_contact_meetingmessage]
    ADD CONSTRAINT [DF_mc_contact_meetingmessage_user_id] DEFAULT ('0') FOR [user_id];

