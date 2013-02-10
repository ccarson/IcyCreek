ALTER TABLE [dbo].[ReportFilters]
    ADD CONSTRAINT [DF_ReportFilters_OutputResponseID] DEFAULT ((0)) FOR [OutputResponseID];

