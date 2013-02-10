ALTER TABLE [dbo].[mc_contact_audit]
    ADD CONSTRAINT [DF_mc_contact_audit_isSuccess] DEFAULT ((0)) FOR [isSuccess];

