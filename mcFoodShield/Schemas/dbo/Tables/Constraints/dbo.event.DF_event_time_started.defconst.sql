ALTER TABLE [dbo].[event]
    ADD CONSTRAINT [DF_event_time_started] DEFAULT ('00:00') FOR [time_started];

