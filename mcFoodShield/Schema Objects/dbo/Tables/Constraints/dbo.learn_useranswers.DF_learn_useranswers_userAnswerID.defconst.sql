ALTER TABLE [dbo].[learn_useranswers]
    ADD CONSTRAINT [DF_learn_useranswers_userAnswerID] DEFAULT (N'') FOR [userAnswerID];

