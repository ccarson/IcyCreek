ALTER TABLE [dbo].[event_invites]
    ADD CONSTRAINT [DF_event_invites_eventFK] DEFAULT (NULL) FOR [eventFK];

