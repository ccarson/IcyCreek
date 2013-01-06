ALTER TABLE [dbo].[pt_project_users]
    ADD CONSTRAINT [DF_pt_project_users_msg_edit] DEFAULT (NULL) FOR [msg_edit];

