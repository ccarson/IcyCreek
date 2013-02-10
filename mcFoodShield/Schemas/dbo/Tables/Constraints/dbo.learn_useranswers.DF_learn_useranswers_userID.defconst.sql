ALTER TABLE [dbo].[learn_useranswers]
    ADD CONSTRAINT [DF_learn_useranswers_userID] DEFAULT (N'') FOR [userID];

