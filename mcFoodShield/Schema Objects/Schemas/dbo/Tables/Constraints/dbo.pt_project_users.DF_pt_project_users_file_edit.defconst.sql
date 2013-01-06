ALTER TABLE [dbo].[pt_project_users]
    ADD CONSTRAINT [DF_pt_project_users_file_edit] DEFAULT (NULL) FOR [file_edit];

