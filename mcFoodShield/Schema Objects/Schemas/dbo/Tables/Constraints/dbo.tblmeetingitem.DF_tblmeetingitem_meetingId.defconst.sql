ALTER TABLE [dbo].[tblmeetingitem]
    ADD CONSTRAINT [DF_tblmeetingitem_meetingId] DEFAULT ((0)) FOR [meetingId];

