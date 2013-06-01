ALTER TABLE [dbo].[p_questions]
    ADD CONSTRAINT [DF_p_questions_question] DEFAULT (N'') FOR [question];

