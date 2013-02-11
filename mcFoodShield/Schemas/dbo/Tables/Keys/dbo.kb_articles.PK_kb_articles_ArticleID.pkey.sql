﻿ALTER TABLE [dbo].[kb_articles]
    ADD CONSTRAINT [PK_kb_articles_ArticleID] PRIMARY KEY CLUSTERED ([ArticleID] ASC) WITH (FILLFACTOR = 90, ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);
