ALTER TABLE [dbo].[event]
    ADD CONSTRAINT [DF_event_date_started] DEFAULT (getdate()) FOR [date_started];

