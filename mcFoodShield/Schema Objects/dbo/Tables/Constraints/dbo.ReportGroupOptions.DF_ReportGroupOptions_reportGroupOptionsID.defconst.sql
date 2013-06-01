ALTER TABLE [dbo].[ReportGroupOptions]
    ADD CONSTRAINT [DF_ReportGroupOptions_reportGroupOptionsID] DEFAULT (newsequentialid()) FOR [reportGroupOptionsID];

