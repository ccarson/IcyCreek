ALTER TABLE [dbo].[plfTemplates]
    ADD CONSTRAINT [DF_plfTemplates_templateType] DEFAULT ('NOTSET') FOR [templateType];

