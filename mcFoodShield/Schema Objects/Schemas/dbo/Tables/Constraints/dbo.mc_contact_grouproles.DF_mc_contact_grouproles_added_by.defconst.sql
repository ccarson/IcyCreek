ALTER TABLE [dbo].[mc_contact_grouproles]
    ADD CONSTRAINT [DF_mc_contact_grouproles_added_by] DEFAULT ('0') FOR [added_by];

