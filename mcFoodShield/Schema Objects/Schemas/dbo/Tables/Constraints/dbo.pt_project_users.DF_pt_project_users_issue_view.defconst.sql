ALTER TABLE [dbo].[pt_project_users]
    ADD CONSTRAINT [DF_pt_project_users_issue_view] DEFAULT (NULL) FOR [issue_view];

