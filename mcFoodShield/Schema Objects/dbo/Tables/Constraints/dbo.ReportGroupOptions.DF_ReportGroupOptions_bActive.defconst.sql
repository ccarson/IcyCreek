ALTER TABLE [dbo].[ReportGroupOptions]
    ADD CONSTRAINT [DF_ReportGroupOptions_bActive] DEFAULT ((1)) FOR [bActive];

