ALTER TABLE [dbo].[pt_issues]
    ADD CONSTRAINT [DF_pt_issues_created] DEFAULT (NULL) FOR [created];

