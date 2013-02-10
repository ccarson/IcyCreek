ALTER TABLE [dbo].[audit_bans]
    ADD CONSTRAINT [DF_audit_bans_bActive] DEFAULT ((1)) FOR [bActive];

