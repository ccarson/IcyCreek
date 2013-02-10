ALTER TABLE [dbo].[ReportVersions]
    ADD CONSTRAINT [FK_ReportVersions_Reports] FOREIGN KEY ([reportsID]) REFERENCES [dbo].[Reports] ([reportsID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

