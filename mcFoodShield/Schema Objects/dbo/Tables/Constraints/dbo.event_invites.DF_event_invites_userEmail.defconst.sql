ALTER TABLE [dbo].[event_invites]
    ADD CONSTRAINT [DF_event_invites_userEmail] DEFAULT (NULL) FOR [userEmail];

