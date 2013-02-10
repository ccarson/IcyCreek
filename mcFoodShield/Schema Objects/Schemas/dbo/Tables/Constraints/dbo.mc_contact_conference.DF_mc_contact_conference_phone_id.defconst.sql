ALTER TABLE [dbo].[mc_contact_conference]
    ADD CONSTRAINT [DF_mc_contact_conference_phone_id] DEFAULT ('0') FOR [phone_id];

