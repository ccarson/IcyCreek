ALTER TABLE [dbo].[event_exception]
    ADD CONSTRAINT [DF_event_exception_date] DEFAULT (getdate()) FOR [date];

