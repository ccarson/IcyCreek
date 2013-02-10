ALTER TABLE [dbo].[learn_answers]
    ADD CONSTRAINT [DF_learn_answers_questionID] DEFAULT (N'') FOR [questionID];

