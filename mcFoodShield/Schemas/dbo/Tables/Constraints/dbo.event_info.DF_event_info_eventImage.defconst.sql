ALTER TABLE [dbo].[event_info]
    ADD CONSTRAINT [DF_event_info_eventImage] DEFAULT (NULL) FOR [eventImage];

