ALTER TABLE [dbo].[learn_regquestions]
    ADD CONSTRAINT [DF_learn_regquestions_createdOn] DEFAULT (getdate()) FOR [createdOn];

