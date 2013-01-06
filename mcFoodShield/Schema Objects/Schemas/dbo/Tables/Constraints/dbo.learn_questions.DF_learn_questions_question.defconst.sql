ALTER TABLE [dbo].[learn_questions]
    ADD CONSTRAINT [DF_learn_questions_question] DEFAULT (N'') FOR [question];

