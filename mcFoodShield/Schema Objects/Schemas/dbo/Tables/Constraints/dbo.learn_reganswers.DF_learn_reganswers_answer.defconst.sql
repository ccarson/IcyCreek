ALTER TABLE [dbo].[learn_reganswers]
    ADD CONSTRAINT [DF_learn_reganswers_answer] DEFAULT (N'') FOR [answer];

