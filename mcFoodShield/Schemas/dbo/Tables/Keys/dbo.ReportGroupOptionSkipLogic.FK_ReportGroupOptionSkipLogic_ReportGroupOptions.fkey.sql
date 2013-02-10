ALTER TABLE [dbo].[ReportGroupOptionSkipLogic]
    ADD CONSTRAINT [FK_ReportGroupOptionSkipLogic_ReportGroupOptions] FOREIGN KEY ([reportGroupOptionsID]) REFERENCES [dbo].[ReportGroupOptions] ([reportGroupOptionsID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

