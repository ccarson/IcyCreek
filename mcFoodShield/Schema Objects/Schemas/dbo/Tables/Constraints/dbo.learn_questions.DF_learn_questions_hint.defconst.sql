ALTER TABLE [dbo].[learn_questions]
    ADD CONSTRAINT [DF_learn_questions_hint] DEFAULT (NULL) FOR [hint];

