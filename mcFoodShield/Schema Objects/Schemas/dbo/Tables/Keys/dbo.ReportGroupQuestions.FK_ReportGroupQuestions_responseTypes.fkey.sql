ALTER TABLE [dbo].[ReportGroupQuestions]
    ADD CONSTRAINT [FK_ReportGroupQuestions_responseTypes] FOREIGN KEY ([reportDataTypesID]) REFERENCES [dbo].[ReportDataTypes] ([reportDataTypesID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

