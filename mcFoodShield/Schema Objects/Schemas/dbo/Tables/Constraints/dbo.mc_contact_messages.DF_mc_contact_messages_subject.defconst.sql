ALTER TABLE [dbo].[mc_contact_messages]
    ADD CONSTRAINT [DF_mc_contact_messages_subject] DEFAULT (N'') FOR [subject];

