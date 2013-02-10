ALTER TABLE [dbo].[event_info]
    ADD CONSTRAINT [DF_event_info_eventStartDate] DEFAULT (NULL) FOR [eventStartDate];

