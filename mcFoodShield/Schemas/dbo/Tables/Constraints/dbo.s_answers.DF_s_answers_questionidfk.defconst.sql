ALTER TABLE [dbo].[s_answers]
    ADD CONSTRAINT [DF_s_answers_questionidfk] DEFAULT (N'') FOR [questionidfk];

