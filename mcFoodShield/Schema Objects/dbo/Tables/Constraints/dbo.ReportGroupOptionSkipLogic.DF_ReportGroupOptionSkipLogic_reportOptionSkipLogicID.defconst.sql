ALTER TABLE [dbo].[ReportGroupOptionSkipLogic]
    ADD CONSTRAINT [DF_ReportGroupOptionSkipLogic_reportOptionSkipLogicID] DEFAULT (newsequentialid()) FOR [reportOptionSkipLogicID];

