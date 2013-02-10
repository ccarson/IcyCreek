ALTER TABLE [dbo].[s_users]
    ADD CONSTRAINT [DF_s_users_survey_id] DEFAULT (N'(0)') FOR [survey_id];

