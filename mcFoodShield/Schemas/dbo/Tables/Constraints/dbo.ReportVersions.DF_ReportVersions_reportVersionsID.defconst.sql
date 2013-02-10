ALTER TABLE [dbo].[ReportVersions]
    ADD CONSTRAINT [DF_ReportVersions_reportVersionsID] DEFAULT (newsequentialid()) FOR [reportVersionsID];

