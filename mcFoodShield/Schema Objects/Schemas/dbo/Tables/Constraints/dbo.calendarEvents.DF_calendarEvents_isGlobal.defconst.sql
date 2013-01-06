ALTER TABLE [dbo].[calendarEvents]
    ADD CONSTRAINT [DF_calendarEvents_isGlobal] DEFAULT ((0)) FOR [isGlobal];

