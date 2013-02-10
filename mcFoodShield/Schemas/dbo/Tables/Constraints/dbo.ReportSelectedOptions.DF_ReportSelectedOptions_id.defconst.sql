ALTER TABLE [dbo].[ReportSelectedOptions]
    ADD CONSTRAINT [DF_ReportSelectedOptions_id] DEFAULT (newsequentialid()) FOR [id];

