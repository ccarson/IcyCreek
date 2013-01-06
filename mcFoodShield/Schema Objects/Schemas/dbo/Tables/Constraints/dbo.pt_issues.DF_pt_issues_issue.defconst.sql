ALTER TABLE [dbo].[pt_issues]
    ADD CONSTRAINT [DF_pt_issues_issue] DEFAULT (NULL) FOR [issue];

