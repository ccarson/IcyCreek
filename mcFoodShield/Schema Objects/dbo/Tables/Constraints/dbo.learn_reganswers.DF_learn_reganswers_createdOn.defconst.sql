ALTER TABLE [dbo].[learn_reganswers]
    ADD CONSTRAINT [DF_learn_reganswers_createdOn] DEFAULT (getdate()) FOR [createdOn];

