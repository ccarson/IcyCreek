ALTER TABLE [dbo].[mc_meeting_conferenceinfo]
    ADD CONSTRAINT [DF_mc_meeting_conferenceinfo_meeting_id] DEFAULT ('0') FOR [meeting_id];

