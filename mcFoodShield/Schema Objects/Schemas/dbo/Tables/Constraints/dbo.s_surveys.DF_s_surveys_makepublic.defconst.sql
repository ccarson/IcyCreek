ALTER TABLE [dbo].[s_surveys]
    ADD CONSTRAINT [DF_s_surveys_makepublic] DEFAULT ((0)) FOR [makepublic];

