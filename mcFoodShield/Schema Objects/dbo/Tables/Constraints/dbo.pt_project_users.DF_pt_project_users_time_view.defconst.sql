ALTER TABLE [dbo].[pt_project_users]
    ADD CONSTRAINT [DF_pt_project_users_time_view] DEFAULT (NULL) FOR [time_view];

