ALTER TABLE [dbo].[rss_rssfeeds]
    ADD CONSTRAINT [DF_rss_rssfeeds_rss_RssDateCreated] DEFAULT (NULL) FOR [rss_RssDateCreated];

