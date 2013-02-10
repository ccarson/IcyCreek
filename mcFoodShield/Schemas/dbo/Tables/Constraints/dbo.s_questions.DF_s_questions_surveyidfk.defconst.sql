ALTER TABLE [dbo].[s_questions]
    ADD CONSTRAINT [DF_s_questions_surveyidfk] DEFAULT (N'') FOR [surveyidfk];

