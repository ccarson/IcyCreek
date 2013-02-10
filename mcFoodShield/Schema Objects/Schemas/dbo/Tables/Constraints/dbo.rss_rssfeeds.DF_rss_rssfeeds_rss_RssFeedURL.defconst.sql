ALTER TABLE [dbo].[rss_rssfeeds]
    ADD CONSTRAINT [DF_rss_rssfeeds_rss_RssFeedURL] DEFAULT (NULL) FOR [rss_RssFeedURL];

