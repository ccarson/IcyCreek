ALTER TABLE [dbo].[pt_user_notify]
    ADD CONSTRAINT [DF_pt_user_notify_email_file_upd] DEFAULT (NULL) FOR [email_file_upd];

