ALTER TABLE [dbo].[ReportVersionFields]
    ADD CONSTRAINT [DF_ReportVersionFields_reportVersionFieldsID] DEFAULT (newsequentialid()) FOR [reportVersionFieldsID];

