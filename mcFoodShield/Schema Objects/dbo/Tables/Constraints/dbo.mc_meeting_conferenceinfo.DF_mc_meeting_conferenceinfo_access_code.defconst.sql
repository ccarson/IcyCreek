ALTER TABLE [dbo].[mc_meeting_conferenceinfo]
    ADD CONSTRAINT [DF_mc_meeting_conferenceinfo_access_code] DEFAULT (NULL) FOR [access_code];

