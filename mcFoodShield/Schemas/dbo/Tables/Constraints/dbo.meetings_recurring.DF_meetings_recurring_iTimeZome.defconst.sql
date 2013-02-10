ALTER TABLE [dbo].[meetings_recurring]
    ADD CONSTRAINT [DF_meetings_recurring_iTimeZome] DEFAULT ('-6') FOR [iTimeZome];

