ALTER TABLE [dbo].[event_info]
    ADD CONSTRAINT [DF_event_info_eventName] DEFAULT (NULL) FOR [eventName];

