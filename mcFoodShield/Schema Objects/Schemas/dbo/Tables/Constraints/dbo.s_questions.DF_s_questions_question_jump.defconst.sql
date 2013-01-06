ALTER TABLE [dbo].[s_questions]
    ADD CONSTRAINT [DF_s_questions_question_jump] DEFAULT ((0)) FOR [question_jump];

