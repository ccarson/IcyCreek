ALTER TABLE [dbo].[security_groups]
    ADD CONSTRAINT [DF_security_groups_active] DEFAULT ((0)) FOR [active];

