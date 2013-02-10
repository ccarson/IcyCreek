ALTER TABLE [dbo].[pt_user_notify]
    ADD CONSTRAINT [DF_pt_user_notify_email_issue_upd] DEFAULT (NULL) FOR [email_issue_upd];

