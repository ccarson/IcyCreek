ALTER TABLE [dbo].[event_info]
    ADD CONSTRAINT [DF_event_info_eventPhone] DEFAULT (NULL) FOR [eventPhone];

