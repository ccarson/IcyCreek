ALTER TABLE [dbo].[mc_contact_addressbook]
    ADD CONSTRAINT [DF_mc_contact_addressbook_favorite] DEFAULT ('0') FOR [favorite];

