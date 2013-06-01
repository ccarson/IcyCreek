ALTER TABLE [dbo].[mc_contact_meetingmessage]
    ADD CONSTRAINT [DF_mc_contact_meetingmessage_meeting_id] DEFAULT ('0') FOR [meeting_id];

