ALTER TABLE [dbo].[ReportGroups]
    ADD CONSTRAINT [DF_ReportGroups_active] DEFAULT ((1)) FOR [active];

