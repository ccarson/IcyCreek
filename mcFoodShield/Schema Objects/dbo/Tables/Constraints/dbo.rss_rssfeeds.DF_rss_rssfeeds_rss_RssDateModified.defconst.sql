ALTER TABLE [dbo].[rss_rssfeeds]
    ADD CONSTRAINT [DF_rss_rssfeeds_rss_RssDateModified] DEFAULT (NULL) FOR [rss_RssDateModified];

