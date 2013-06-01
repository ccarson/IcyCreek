ALTER TABLE [dbo].[learn_answers]
    ADD CONSTRAINT [DF_learn_answers_answer] DEFAULT (N'') FOR [answer];

