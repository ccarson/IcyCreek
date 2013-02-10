ALTER TABLE [dbo].[s_surveys]
    ADD CONSTRAINT [DF_s_surveys_useridfk] DEFAULT ('0') FOR [useridfk];

