ALTER TABLE [dbo].[mc_contact_affiliations]
    ADD CONSTRAINT [DF_mc_contact_affiliations_bActive] DEFAULT ((1)) FOR [bActive];

