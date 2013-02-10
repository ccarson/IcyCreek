ALTER TABLE [dbo].[ReportFilters]
    ADD CONSTRAINT [DF_ReportFilters_outputUpdatedDate] DEFAULT ((1)) FOR [outputUpdatedDate];

