ALTER TABLE [dbo].[learn_questions]
    ADD CONSTRAINT [DF_learn_questions_questionID] DEFAULT (N'') FOR [questionID];

