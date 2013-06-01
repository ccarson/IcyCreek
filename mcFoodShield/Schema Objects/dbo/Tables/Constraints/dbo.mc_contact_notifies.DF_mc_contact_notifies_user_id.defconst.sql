ALTER TABLE [dbo].[mc_contact_notifies]
    ADD CONSTRAINT [DF_mc_contact_notifies_user_id] DEFAULT ('0') FOR [user_id];

