ALTER TABLE [dbo].[mc_contact_conference]
    ADD CONSTRAINT [DF_mc_contact_conference_location_id] DEFAULT ('0') FOR [location_id];

