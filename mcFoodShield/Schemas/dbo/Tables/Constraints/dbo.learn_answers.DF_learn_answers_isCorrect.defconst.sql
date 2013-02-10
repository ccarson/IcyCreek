ALTER TABLE [dbo].[learn_answers]
    ADD CONSTRAINT [DF_learn_answers_isCorrect] DEFAULT ('0') FOR [isCorrect];

