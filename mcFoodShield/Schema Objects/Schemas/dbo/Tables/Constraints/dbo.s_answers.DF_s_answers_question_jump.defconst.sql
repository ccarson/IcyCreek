ALTER TABLE [dbo].[s_answers]
    ADD CONSTRAINT [DF_s_answers_question_jump] DEFAULT ((0)) FOR [question_jump];

