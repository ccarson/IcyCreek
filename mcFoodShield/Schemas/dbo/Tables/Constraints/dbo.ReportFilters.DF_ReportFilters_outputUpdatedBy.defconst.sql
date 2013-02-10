ALTER TABLE [dbo].[ReportFilters]
    ADD CONSTRAINT [DF_ReportFilters_outputUpdatedBy] DEFAULT ((1)) FOR [outputUpdatedBy];

