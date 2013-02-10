ALTER TABLE [dbo].[audit_login_history]
    ADD CONSTRAINT [DF_audit_login_history_user_id] DEFAULT ('0') FOR [user_id];

