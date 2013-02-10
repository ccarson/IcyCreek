ALTER TABLE [dbo].[mc_contact_addressbook]
    ADD CONSTRAINT [DF_mc_contact_addressbook_contact_id] DEFAULT ('0') FOR [contact_id];

