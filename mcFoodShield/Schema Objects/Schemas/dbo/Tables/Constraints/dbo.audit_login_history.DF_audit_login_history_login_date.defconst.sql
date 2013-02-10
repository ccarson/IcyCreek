ALTER TABLE [dbo].[audit_login_history]
    ADD CONSTRAINT [DF_audit_login_history_login_date] DEFAULT (NULL) FOR [login_date];

