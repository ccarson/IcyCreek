ALTER TABLE [dbo].[event_invites]
    ADD CONSTRAINT [DF_event_invites_dateInvited] DEFAULT (NULL) FOR [dateInvited];

