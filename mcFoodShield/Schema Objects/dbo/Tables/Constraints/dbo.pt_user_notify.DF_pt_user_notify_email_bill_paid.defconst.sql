ALTER TABLE [dbo].[pt_user_notify]
    ADD CONSTRAINT [DF_pt_user_notify_email_bill_paid] DEFAULT (NULL) FOR [email_bill_paid];

