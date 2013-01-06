ALTER TABLE [dbo].[event_info]
    ADD CONSTRAINT [DF_event_info_eventFK] DEFAULT (NULL) FOR [eventFK];

