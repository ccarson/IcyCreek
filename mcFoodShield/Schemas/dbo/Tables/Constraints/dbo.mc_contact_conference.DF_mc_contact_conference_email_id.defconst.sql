ALTER TABLE [dbo].[mc_contact_conference]
    ADD CONSTRAINT [DF_mc_contact_conference_email_id] DEFAULT ('0') FOR [email_id];

