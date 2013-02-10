ALTER TABLE [dbo].[learn_questions]
    ADD CONSTRAINT [DF_learn_questions_questionDisplayOrder] DEFAULT ('0') FOR [questionDisplayOrder];

