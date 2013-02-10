ALTER TABLE [dbo].[pt_project_users]
    ADD CONSTRAINT [DF_pt_project_users_svn] DEFAULT (NULL) FOR [svn];

