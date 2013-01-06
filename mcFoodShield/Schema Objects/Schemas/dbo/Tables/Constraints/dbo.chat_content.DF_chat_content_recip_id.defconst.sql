ALTER TABLE [dbo].[chat_content]
    ADD CONSTRAINT [DF_chat_content_recip_id] DEFAULT (N'') FOR [recip_id];

