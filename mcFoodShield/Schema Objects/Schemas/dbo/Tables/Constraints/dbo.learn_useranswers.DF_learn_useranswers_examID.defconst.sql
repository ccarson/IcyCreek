ALTER TABLE [dbo].[learn_useranswers]
    ADD CONSTRAINT [DF_learn_useranswers_examID] DEFAULT (N'') FOR [examID];

