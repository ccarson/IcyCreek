ALTER TABLE [dbo].[ReportGroupOptions]
    ADD CONSTRAINT [DF_ReportGroupOptions_isAutoSuggest] DEFAULT ((0)) FOR [isAutoSuggest];

