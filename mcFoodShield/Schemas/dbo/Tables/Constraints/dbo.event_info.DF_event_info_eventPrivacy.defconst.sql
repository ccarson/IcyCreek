ALTER TABLE [dbo].[event_info]
    ADD CONSTRAINT [DF_event_info_eventPrivacy] DEFAULT (NULL) FOR [eventPrivacy];

