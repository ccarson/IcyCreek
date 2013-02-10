ALTER TABLE [dbo].[learn_reganswers]
    ADD CONSTRAINT [DF_learn_reganswers_createdBy] DEFAULT (N'') FOR [createdBy];

