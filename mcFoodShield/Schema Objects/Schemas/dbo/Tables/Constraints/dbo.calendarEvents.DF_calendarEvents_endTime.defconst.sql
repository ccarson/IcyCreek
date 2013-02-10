ALTER TABLE [dbo].[calendarEvents]
    ADD CONSTRAINT [DF_calendarEvents_endTime] DEFAULT (sysdatetime()) FOR [endTime];

