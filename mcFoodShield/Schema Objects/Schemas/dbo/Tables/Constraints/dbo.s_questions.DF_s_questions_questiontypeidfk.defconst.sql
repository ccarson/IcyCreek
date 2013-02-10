ALTER TABLE [dbo].[s_questions]
    ADD CONSTRAINT [DF_s_questions_questiontypeidfk] DEFAULT (N'') FOR [questiontypeidfk];

