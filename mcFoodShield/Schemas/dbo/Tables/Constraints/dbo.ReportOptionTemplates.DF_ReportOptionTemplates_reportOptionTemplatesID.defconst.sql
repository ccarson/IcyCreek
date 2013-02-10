ALTER TABLE [dbo].[ReportOptionTemplates]
    ADD CONSTRAINT [DF_ReportOptionTemplates_reportOptionTemplatesID] DEFAULT (newsequentialid()) FOR [reportOptionTemplatesID];

