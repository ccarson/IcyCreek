ALTER TABLE [dbo].[s_surveys]
    ADD CONSTRAINT [DF_s_surveys_description] DEFAULT (N'') FOR [description];

