ALTER TABLE [dbo].[pt_project_users]
    ADD CONSTRAINT [DF_pt_project_users_mstone_comment] DEFAULT (NULL) FOR [mstone_comment];

