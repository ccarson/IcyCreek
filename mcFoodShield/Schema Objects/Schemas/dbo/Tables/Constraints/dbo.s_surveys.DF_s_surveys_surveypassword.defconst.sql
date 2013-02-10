ALTER TABLE [dbo].[s_surveys]
    ADD CONSTRAINT [DF_s_surveys_surveypassword] DEFAULT (N'') FOR [surveypassword];

