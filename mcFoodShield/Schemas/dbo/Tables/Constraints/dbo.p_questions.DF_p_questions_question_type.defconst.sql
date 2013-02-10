ALTER TABLE [dbo].[p_questions]
    ADD CONSTRAINT [DF_p_questions_question_type] DEFAULT (N'') FOR [question_type];

