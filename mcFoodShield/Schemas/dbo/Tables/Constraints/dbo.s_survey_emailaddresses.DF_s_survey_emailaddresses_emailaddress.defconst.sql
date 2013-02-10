ALTER TABLE [dbo].[s_survey_emailaddresses]
    ADD CONSTRAINT [DF_s_survey_emailaddresses_emailaddress] DEFAULT (N'') FOR [emailaddress];

