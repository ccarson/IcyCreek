ALTER TABLE [dbo].[s_surveys]
    ADD CONSTRAINT [DF_s_surveys_templateidfk] DEFAULT (NULL) FOR [templateidfk];

