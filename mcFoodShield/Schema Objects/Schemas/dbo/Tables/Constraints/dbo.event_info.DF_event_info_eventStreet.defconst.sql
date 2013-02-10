ALTER TABLE [dbo].[event_info]
    ADD CONSTRAINT [DF_event_info_eventStreet] DEFAULT (NULL) FOR [eventStreet];

