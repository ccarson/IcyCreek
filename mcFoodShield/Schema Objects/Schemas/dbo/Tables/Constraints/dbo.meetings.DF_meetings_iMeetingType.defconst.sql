ALTER TABLE [dbo].[meetings]
    ADD CONSTRAINT [DF_meetings_iMeetingType] DEFAULT ((0)) FOR [iMeetingType];

