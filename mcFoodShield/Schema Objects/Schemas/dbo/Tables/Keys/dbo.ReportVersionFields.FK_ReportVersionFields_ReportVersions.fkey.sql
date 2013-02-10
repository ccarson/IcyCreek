ALTER TABLE [dbo].[ReportVersionFields]
    ADD CONSTRAINT [FK_ReportVersionFields_ReportVersions] FOREIGN KEY ([reportVersionsID]) REFERENCES [dbo].[ReportVersions] ([reportVersionsID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

