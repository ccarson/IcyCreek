ALTER TABLE [dbo].[mc_contact_grouproles]
    ADD CONSTRAINT [DF_mc_contact_grouproles_group_id] DEFAULT ('0') FOR [group_id];

