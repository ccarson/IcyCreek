ALTER TABLE [dbo].[ReportOptionTemplates]
    ADD CONSTRAINT [DF_ReportOptionTemplates_isAutoSuggest] DEFAULT ((0)) FOR [isAutoSuggest];

