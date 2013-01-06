ALTER TABLE [dbo].[mc_contact_audit]
    ADD CONSTRAINT [DF_mc_contact_audit_user_id] DEFAULT ('0') FOR [user_id];

