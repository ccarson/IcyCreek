ALTER TABLE [dbo].[mc_contact_grouproles]
    ADD CONSTRAINT [DF_mc_contact_grouproles_custom_role_id] DEFAULT ('0') FOR [custom_role_id];

