ALTER TABLE [dbo].[mc_contact_audit]
    ADD CONSTRAINT [DF_mc_contact_audit_dateCreated] DEFAULT (getdate()) FOR [dateCreated];

