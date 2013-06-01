ALTER TABLE [dbo].[calendarEvents]
    ADD CONSTRAINT [DF_calendarEvents_startTime] DEFAULT (sysdatetime()) FOR [startTime];

