ALTER TABLE [dbo].[event_invites]
    ADD CONSTRAINT [DF_event_invites_inviteStatus] DEFAULT ('0') FOR [inviteStatus];

