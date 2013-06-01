ALTER TABLE [dbo].[pt_issues]
    ADD CONSTRAINT [DF_pt_issues_severity] DEFAULT (NULL) FOR [severity];

