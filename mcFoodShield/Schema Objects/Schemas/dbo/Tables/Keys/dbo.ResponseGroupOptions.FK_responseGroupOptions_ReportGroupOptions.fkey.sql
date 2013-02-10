ALTER TABLE [dbo].[ResponseGroupOptions]
    ADD CONSTRAINT [FK_responseGroupOptions_ReportGroupOptions] FOREIGN KEY ([reportGroupOptionsID]) REFERENCES [dbo].[ReportGroupOptions] ([reportGroupOptionsID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

