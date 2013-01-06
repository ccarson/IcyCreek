ALTER TABLE [dbo].[meetings_attachments]
    ADD CONSTRAINT [DF_meetings_attachments_iMeetingID] DEFAULT ('0') FOR [iMeetingID];

