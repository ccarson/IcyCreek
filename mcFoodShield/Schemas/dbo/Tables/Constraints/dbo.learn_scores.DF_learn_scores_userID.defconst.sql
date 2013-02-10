ALTER TABLE [dbo].[learn_scores]
    ADD CONSTRAINT [DF_learn_scores_userID] DEFAULT (N'') FOR [userID];

