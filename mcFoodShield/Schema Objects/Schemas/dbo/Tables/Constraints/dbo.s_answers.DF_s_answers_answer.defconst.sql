ALTER TABLE [dbo].[s_answers]
    ADD CONSTRAINT [DF_s_answers_answer] DEFAULT (N'') FOR [answer];

