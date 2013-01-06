ALTER TABLE [dbo].[mc_contact_messages]
    ADD CONSTRAINT [DF_mc_contact_messages_active] DEFAULT ((0)) FOR [active];

