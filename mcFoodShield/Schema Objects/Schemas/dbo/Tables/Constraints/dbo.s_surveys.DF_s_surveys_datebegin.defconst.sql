ALTER TABLE [dbo].[s_surveys]
    ADD CONSTRAINT [DF_s_surveys_datebegin] DEFAULT (NULL) FOR [datebegin];

