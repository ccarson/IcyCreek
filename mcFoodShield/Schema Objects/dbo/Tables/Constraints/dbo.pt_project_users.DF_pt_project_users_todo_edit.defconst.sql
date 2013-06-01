ALTER TABLE [dbo].[pt_project_users]
    ADD CONSTRAINT [DF_pt_project_users_todo_edit] DEFAULT (NULL) FOR [todo_edit];

