ALTER TABLE [dbo].[ReportGroupOptions]
    ADD CONSTRAINT [DF_ReportGroupOptions_ResponseScore] DEFAULT ((0)) FOR [ResponseScore];

