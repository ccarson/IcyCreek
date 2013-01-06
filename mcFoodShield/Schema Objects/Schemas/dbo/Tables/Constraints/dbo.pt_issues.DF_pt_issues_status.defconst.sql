ALTER TABLE [dbo].[pt_issues]
    ADD CONSTRAINT [DF_pt_issues_status] DEFAULT (NULL) FOR [status];

