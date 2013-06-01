ALTER TABLE [dbo].[event_info]
    ADD CONSTRAINT [DF_event_info_eventCity] DEFAULT (NULL) FOR [eventCity];

