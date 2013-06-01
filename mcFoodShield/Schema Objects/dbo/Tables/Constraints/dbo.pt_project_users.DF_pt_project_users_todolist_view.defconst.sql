ALTER TABLE [dbo].[pt_project_users]
    ADD CONSTRAINT [DF_pt_project_users_todolist_view] DEFAULT (NULL) FOR [todolist_view];

