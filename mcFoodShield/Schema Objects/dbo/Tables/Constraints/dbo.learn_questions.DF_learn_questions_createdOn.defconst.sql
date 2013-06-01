ALTER TABLE [dbo].[learn_questions]
    ADD CONSTRAINT [DF_learn_questions_createdOn] DEFAULT (getdate()) FOR [createdOn];

