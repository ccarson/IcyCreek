ALTER TABLE [dbo].[mc_contact_conference]
    ADD CONSTRAINT [DF_mc_contact_conference_confirm_pdf] DEFAULT (NULL) FOR [confirm_pdf];

