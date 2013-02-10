ALTER TABLE [dbo].[pt_messages]
    ADD CONSTRAINT [DF_pt_messages_stamp] DEFAULT (NULL) FOR [stamp];

