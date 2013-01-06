ALTER TABLE [dbo].[mc_contact_messages]
    ADD CONSTRAINT [DF_mc_contact_messages_admin_id] DEFAULT ('0') FOR [admin_id];

