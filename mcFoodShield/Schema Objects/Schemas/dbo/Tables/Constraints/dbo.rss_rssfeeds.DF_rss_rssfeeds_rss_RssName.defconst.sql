ALTER TABLE [dbo].[rss_rssfeeds]
    ADD CONSTRAINT [DF_rss_rssfeeds_rss_RssName] DEFAULT (NULL) FOR [rss_RssName];

