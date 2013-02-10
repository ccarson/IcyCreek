ALTER TABLE [dbo].[ReportGroups]
    ADD CONSTRAINT [DF_ReportGroups_ForReporting] DEFAULT ((0)) FOR [ForReporting];

