ALTER TABLE [dbo].[pt_project_users]
    ADD CONSTRAINT [DF_pt_project_users_issue_comment] DEFAULT (NULL) FOR [issue_comment];

