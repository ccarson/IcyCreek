ALTER TABLE [dbo].[mc_contact_grouproles]
    ADD CONSTRAINT [DF_mc_contact_grouproles_added_date] DEFAULT (NULL) FOR [added_date];

