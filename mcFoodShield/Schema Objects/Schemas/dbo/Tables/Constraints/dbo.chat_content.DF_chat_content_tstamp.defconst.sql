ALTER TABLE [dbo].[chat_content]
    ADD CONSTRAINT [DF_chat_content_tstamp] DEFAULT (NULL) FOR [tstamp];

