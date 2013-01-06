ALTER TABLE [dbo].[ReportGroups]
    ADD CONSTRAINT [FK_ReportGroups_ReportVersions] FOREIGN KEY ([reportVersionsID]) REFERENCES [dbo].[ReportVersions] ([reportVersionsID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

