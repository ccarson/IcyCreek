ALTER TABLE [dbo].[event_invites]
    ADD CONSTRAINT [DF_event_invites_acceptedDate] DEFAULT (NULL) FOR [acceptedDate];

