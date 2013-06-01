ALTER TABLE [dbo].[s_surveys]
    ADD CONSTRAINT [DF_s_surveys_active] DEFAULT ((0)) FOR [active];

