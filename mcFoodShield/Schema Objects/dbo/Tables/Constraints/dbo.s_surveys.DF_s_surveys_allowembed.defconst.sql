ALTER TABLE [dbo].[s_surveys]
    ADD CONSTRAINT [DF_s_surveys_allowembed] DEFAULT ((0)) FOR [allowembed];

