ALTER TABLE [dbo].[learn_questions]
    ADD CONSTRAINT [DF_learn_questions_createdBy] DEFAULT (N'') FOR [createdBy];

