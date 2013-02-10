ALTER TABLE [dbo].[s_questions]
    ADD CONSTRAINT [DF_s_questions_question_jump_ref] DEFAULT (NULL) FOR [question_jump_ref];

