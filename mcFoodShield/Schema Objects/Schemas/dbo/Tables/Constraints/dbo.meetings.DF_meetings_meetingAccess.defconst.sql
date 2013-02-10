ALTER TABLE [dbo].[meetings]
    ADD CONSTRAINT [DF_meetings_meetingAccess] DEFAULT (N'public') FOR [meetingAccess];

