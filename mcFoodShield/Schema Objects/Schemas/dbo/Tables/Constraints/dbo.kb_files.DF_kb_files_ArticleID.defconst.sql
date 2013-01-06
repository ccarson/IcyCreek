ALTER TABLE [dbo].[kb_files]
    ADD CONSTRAINT [DF_kb_files_ArticleID] DEFAULT ('0') FOR [ArticleID];

