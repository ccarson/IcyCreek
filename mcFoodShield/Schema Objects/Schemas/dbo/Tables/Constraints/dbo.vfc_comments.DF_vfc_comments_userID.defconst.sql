ALTER TABLE [dbo].[vfc_comments]
    ADD CONSTRAINT [DF_vfc_comments_userID] DEFAULT ('0') FOR [userID];

