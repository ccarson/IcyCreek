CREATE TABLE [dbo].[cflm_links] (
    [linkid]          INT           IDENTITY (1, 1) NOT NULL,
    [link_name]       VARCHAR (150) NOT NULL,
    [link_url]        VARCHAR (255) NOT NULL,
    [link_version]    VARCHAR (50)  NULL,
    [link_hits]       INT           NOT NULL,
    [link_author]     INT           NOT NULL,
    [date_entered]    DATETIME2 (0) NULL,
    [description]     VARCHAR (500) NULL,
    [link_cost]       REAL          NOT NULL,
    [is_active]       BIT           NOT NULL,
    [author_notified] BIT           NOT NULL,
    [isPublic]        BIT           NOT NULL
);

