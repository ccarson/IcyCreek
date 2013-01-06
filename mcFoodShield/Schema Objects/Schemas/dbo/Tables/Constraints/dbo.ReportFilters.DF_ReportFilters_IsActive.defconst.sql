ALTER TABLE [dbo].[ReportFilters]
    ADD CONSTRAINT [DF_ReportFilters_IsActive] DEFAULT ((1)) FOR [IsActive];

