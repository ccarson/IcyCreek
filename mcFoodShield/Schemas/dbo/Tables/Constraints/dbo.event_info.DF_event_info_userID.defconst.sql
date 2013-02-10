ALTER TABLE [dbo].[event_info]
    ADD CONSTRAINT [DF_event_info_userID] DEFAULT (NULL) FOR [userID];

