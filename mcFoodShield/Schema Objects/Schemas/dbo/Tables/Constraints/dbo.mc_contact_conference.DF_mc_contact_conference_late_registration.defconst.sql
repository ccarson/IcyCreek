ALTER TABLE [dbo].[mc_contact_conference]
    ADD CONSTRAINT [DF_mc_contact_conference_late_registration] DEFAULT ((0)) FOR [late_registration];

