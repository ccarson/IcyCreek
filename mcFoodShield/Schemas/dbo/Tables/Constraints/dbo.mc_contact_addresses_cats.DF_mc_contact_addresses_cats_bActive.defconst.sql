ALTER TABLE [dbo].[mc_contact_addresses_cats]
    ADD CONSTRAINT [DF_mc_contact_addresses_cats_bActive] DEFAULT ((1)) FOR [bActive];

