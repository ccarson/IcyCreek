ALTER TABLE [dbo].[pt_user_notify]
    ADD CONSTRAINT [DF_pt_user_notify_email_todo_com] DEFAULT (NULL) FOR [email_todo_com];

