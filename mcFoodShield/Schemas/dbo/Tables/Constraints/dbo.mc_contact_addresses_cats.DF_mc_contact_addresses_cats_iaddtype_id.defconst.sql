ALTER TABLE [dbo].[mc_contact_addresses_cats]
    ADD CONSTRAINT [DF_mc_contact_addresses_cats_iaddtype_id] DEFAULT ('0') FOR [iaddtype_id];

