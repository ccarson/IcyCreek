ALTER TABLE [dbo].[mc_contact_addressbook]
    ADD CONSTRAINT [DF_mc_contact_addressbook_user_id] DEFAULT ('0') FOR [user_id];

