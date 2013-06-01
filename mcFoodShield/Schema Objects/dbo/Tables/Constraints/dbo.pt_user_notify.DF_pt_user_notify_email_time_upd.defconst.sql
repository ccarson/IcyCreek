ALTER TABLE [dbo].[pt_user_notify]
    ADD CONSTRAINT [DF_pt_user_notify_email_time_upd] DEFAULT (NULL) FOR [email_time_upd];

