ALTER TABLE [dbo].[event]
    ADD CONSTRAINT [DF_event_time_ended] DEFAULT ('00:00') FOR [time_ended];

