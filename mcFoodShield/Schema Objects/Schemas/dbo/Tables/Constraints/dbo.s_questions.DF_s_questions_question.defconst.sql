ALTER TABLE [dbo].[s_questions]
    ADD CONSTRAINT [DF_s_questions_question] DEFAULT (N'') FOR [question];

