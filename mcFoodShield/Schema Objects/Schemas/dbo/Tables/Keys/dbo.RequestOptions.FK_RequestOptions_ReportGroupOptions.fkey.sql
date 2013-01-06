ALTER TABLE [dbo].[RequestOptions]
    ADD CONSTRAINT [FK_RequestOptions_ReportGroupOptions] FOREIGN KEY ([reportGroupOptionsID]) REFERENCES [dbo].[ReportGroupOptions] ([reportGroupOptionsID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

