ALTER TABLE [dbo].[s_answers]
    ADD CONSTRAINT [DF_s_answers_question_jump_ref] DEFAULT (NULL) FOR [question_jump_ref];

