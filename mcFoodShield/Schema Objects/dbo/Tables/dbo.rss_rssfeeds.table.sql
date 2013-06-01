CREATE TABLE [dbo].[rss_rssfeeds] (
    [rss_RssFeedID]       INT            IDENTITY (10, 1) NOT NULL,
    [rss_RssCreatorID]    INT            NOT NULL,
    [rss_RssDateCreated]  DATETIME2 (0)  NULL,
    [rss_RssDateModified] DATETIME2 (0)  NULL,
    [rss_RssFeedURL]      NVARCHAR (250) NULL,
    [rss_RssGroup_ID]     INT            NOT NULL,
    [rss_RssName]         NVARCHAR (50)  NULL,
    [rss_RssDescription]  NVARCHAR (MAX) NULL,
    [rss_RssModifiedBy]   INT            NULL
);

