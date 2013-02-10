ALTER TABLE [dbo].[plfUsers]
    ADD CONSTRAINT [DF_plfUsers_userIsAdmin] DEFAULT ('NO') FOR [userIsAdmin];

