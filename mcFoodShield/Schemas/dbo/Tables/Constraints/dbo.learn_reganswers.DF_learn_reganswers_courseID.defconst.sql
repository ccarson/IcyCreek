ALTER TABLE [dbo].[learn_reganswers]
    ADD CONSTRAINT [DF_learn_reganswers_courseID] DEFAULT (N'') FOR [courseID];

