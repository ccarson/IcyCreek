ALTER TABLE [dbo].[meetings_recurring]
    ADD CONSTRAINT [DF_meetings_recurring_bActive] DEFAULT ((1)) FOR [bActive];

