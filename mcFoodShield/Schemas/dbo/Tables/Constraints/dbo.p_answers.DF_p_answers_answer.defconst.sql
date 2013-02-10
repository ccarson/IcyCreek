ALTER TABLE [dbo].[p_answers]
    ADD CONSTRAINT [DF_p_answers_answer] DEFAULT (N'') FOR [answer];

