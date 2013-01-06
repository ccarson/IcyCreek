ALTER TABLE [dbo].[mc_meeting_conferenceinfo]
    ADD CONSTRAINT [DF_mc_meeting_conferenceinfo_0dial_number] DEFAULT ('0') FOR [0dial_number];

