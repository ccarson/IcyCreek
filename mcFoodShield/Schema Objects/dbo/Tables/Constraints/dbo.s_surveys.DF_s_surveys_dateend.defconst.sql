ALTER TABLE [dbo].[s_surveys]
    ADD CONSTRAINT [DF_s_surveys_dateend] DEFAULT (NULL) FOR [dateend];

