ALTER TABLE [dbo].[mc_contact_conference]
    ADD CONSTRAINT [DF_mc_contact_conference_degrees] DEFAULT (NULL) FOR [degrees];

