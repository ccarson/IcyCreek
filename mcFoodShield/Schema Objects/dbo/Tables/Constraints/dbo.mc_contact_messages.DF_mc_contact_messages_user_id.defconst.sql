ALTER TABLE [dbo].[mc_contact_messages]
    ADD CONSTRAINT [DF_mc_contact_messages_user_id] DEFAULT ('0') FOR [user_id];

