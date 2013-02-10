ALTER TABLE [dbo].[pt_user_notify]
    ADD CONSTRAINT [DF_pt_user_notify_email_time_new] DEFAULT (NULL) FOR [email_time_new];

