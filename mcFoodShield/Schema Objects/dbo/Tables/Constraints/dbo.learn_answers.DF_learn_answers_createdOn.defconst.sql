ALTER TABLE [dbo].[learn_answers]
    ADD CONSTRAINT [DF_learn_answers_createdOn] DEFAULT (getdate()) FOR [createdOn];

