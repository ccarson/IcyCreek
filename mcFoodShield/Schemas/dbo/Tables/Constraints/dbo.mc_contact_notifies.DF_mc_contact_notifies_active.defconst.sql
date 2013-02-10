ALTER TABLE [dbo].[mc_contact_notifies]
    ADD CONSTRAINT [DF_mc_contact_notifies_active] DEFAULT ((0)) FOR [active];

