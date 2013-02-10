ALTER TABLE [dbo].[s_surveys]
    ADD CONSTRAINT [DF_s_surveys_name] DEFAULT (N'') FOR [name];

