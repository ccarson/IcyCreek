ALTER TABLE [dbo].[mc_contact_conference]
    ADD CONSTRAINT [DF_mc_contact_conference_added_date] DEFAULT (NULL) FOR [added_date];

