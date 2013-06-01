ALTER TABLE [dbo].[mc_contact_conference]
    ADD CONSTRAINT [DF_mc_contact_conference_fax_id] DEFAULT ('0') FOR [fax_id];

