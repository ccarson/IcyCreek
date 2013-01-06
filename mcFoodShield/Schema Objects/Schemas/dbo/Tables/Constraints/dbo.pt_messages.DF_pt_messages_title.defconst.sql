ALTER TABLE [dbo].[pt_messages]
    ADD CONSTRAINT [DF_pt_messages_title] DEFAULT (NULL) FOR [title];

