ALTER TABLE [dbo].[ReportGroupQuestionIndicators]
    ADD CONSTRAINT [FK_ReportGroupQuestionIndicators_reportIndicatorID] FOREIGN KEY ([reportIndicatorID]) REFERENCES [dbo].[ReportIndicators] ([reportIndicatorID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

