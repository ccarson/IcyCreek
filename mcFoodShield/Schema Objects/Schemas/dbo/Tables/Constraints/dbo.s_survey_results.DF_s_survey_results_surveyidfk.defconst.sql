ALTER TABLE [dbo].[s_survey_results]
    ADD CONSTRAINT [DF_s_survey_results_surveyidfk] DEFAULT (N'') FOR [surveyidfk];

