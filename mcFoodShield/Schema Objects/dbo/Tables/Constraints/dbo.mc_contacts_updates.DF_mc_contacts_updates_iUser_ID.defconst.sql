ALTER TABLE [dbo].[mc_contacts_updates]
    ADD CONSTRAINT [DF_mc_contacts_updates_iUser_ID] DEFAULT ('0') FOR [iUser_ID];

