ALTER TABLE [dbo].[mc_contact_grouproles]
    ADD CONSTRAINT [DF_mc_contact_grouproles_standard_role_id] DEFAULT ('0') FOR [standard_role_id];

