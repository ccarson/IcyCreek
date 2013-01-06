ALTER TABLE [dbo].[pt_issues]
    ADD CONSTRAINT [DF_pt_issues_dueDate] DEFAULT (NULL) FOR [dueDate];

