ALTER TABLE [dbo].[learn_coursetousers]
    ADD CONSTRAINT [DF_learn_coursetousers_userID] DEFAULT (N'') FOR [userID];

