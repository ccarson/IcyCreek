ALTER TABLE [dbo].[mc_contact_grouproles]
    ADD CONSTRAINT [DF_mc_contact_grouproles_user_id] DEFAULT ('0') FOR [user_id];

