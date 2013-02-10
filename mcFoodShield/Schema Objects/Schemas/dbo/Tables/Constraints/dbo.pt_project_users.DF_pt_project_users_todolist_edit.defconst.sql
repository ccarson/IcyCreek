ALTER TABLE [dbo].[pt_project_users]
    ADD CONSTRAINT [DF_pt_project_users_todolist_edit] DEFAULT (NULL) FOR [todolist_edit];

