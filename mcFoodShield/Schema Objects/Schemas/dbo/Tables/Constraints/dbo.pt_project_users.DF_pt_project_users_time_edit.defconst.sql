ALTER TABLE [dbo].[pt_project_users]
    ADD CONSTRAINT [DF_pt_project_users_time_edit] DEFAULT (NULL) FOR [time_edit];

