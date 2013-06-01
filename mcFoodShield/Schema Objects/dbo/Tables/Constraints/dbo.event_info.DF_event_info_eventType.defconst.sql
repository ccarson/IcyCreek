ALTER TABLE [dbo].[event_info]
    ADD CONSTRAINT [DF_event_info_eventType] DEFAULT (NULL) FOR [eventType];

