ALTER TABLE [dbo].[mc_contact_audit]
    ADD CONSTRAINT [DF_mc_contact_audit_activity_id] DEFAULT ('0') FOR [activity_id];

