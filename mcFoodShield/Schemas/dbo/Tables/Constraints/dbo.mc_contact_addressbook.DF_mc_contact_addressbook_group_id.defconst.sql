ALTER TABLE [dbo].[mc_contact_addressbook]
    ADD CONSTRAINT [DF_mc_contact_addressbook_group_id] DEFAULT ('0') FOR [group_id];

