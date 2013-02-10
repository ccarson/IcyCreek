ALTER TABLE [dbo].[event_exception]
    ADD CONSTRAINT [DF_event_exception_event_id] DEFAULT ((0)) FOR [event_id];

