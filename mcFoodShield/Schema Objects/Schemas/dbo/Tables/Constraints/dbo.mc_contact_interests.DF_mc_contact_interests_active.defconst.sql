ALTER TABLE [dbo].[mc_contact_interests]
    ADD CONSTRAINT [DF_mc_contact_interests_active] DEFAULT ((0)) FOR [active];

