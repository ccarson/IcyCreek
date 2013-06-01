ALTER TABLE [dbo].[learn_reganswers]
    ADD CONSTRAINT [DF_learn_reganswers_questionID] DEFAULT (N'') FOR [questionID];

