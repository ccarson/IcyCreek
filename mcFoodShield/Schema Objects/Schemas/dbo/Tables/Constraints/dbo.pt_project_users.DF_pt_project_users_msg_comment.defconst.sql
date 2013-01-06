ALTER TABLE [dbo].[pt_project_users]
    ADD CONSTRAINT [DF_pt_project_users_msg_comment] DEFAULT (NULL) FOR [msg_comment];

