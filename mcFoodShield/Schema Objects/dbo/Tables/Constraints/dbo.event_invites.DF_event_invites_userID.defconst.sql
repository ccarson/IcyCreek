ALTER TABLE [dbo].[event_invites]
    ADD CONSTRAINT [DF_event_invites_userID] DEFAULT ('0') FOR [userID];

