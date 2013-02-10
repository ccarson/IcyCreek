ALTER TABLE [dbo].[ReportGroupOptions]
    ADD CONSTRAINT [FK_ReportGroupOptions_responseTypes] FOREIGN KEY ([reportDataTypesID]) REFERENCES [dbo].[ReportDataTypes] ([reportDataTypesID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

