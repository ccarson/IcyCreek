ALTER TABLE [dbo].[mc_contact_addresses_cats]
    ADD CONSTRAINT [DF_mc_contact_addresses_cats_iaddress_id] DEFAULT ('0') FOR [iaddress_id];

