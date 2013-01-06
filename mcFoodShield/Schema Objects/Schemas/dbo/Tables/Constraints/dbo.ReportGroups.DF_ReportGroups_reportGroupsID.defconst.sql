ALTER TABLE [dbo].[ReportGroups]
    ADD CONSTRAINT [DF_ReportGroups_reportGroupsID] DEFAULT (newsequentialid()) FOR [reportGroupsID];

