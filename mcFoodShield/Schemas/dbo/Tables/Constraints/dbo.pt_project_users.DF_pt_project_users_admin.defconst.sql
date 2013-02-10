ALTER TABLE [dbo].[pt_project_users]
    ADD CONSTRAINT [DF_pt_project_users_admin] DEFAULT (NULL) FOR [admin];

