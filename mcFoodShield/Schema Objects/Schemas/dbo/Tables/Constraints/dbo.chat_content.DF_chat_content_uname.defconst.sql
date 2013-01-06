ALTER TABLE [dbo].[chat_content]
    ADD CONSTRAINT [DF_chat_content_uname] DEFAULT (N'') FOR [uname];

