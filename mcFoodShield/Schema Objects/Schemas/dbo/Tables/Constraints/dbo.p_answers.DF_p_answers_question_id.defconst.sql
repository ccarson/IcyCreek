ALTER TABLE [dbo].[p_answers]
    ADD CONSTRAINT [DF_p_answers_question_id] DEFAULT ('0') FOR [question_id];

