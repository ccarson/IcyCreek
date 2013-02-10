ALTER TABLE [dbo].[calendarEvents]
    ADD CONSTRAINT [DF_calendarEvents_id] DEFAULT (newsequentialid()) FOR [id];

