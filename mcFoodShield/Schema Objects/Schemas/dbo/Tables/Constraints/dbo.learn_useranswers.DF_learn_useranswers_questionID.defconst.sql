ALTER TABLE [dbo].[learn_useranswers]
    ADD CONSTRAINT [DF_learn_useranswers_questionID] DEFAULT (N'') FOR [questionID];

