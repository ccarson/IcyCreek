CREATE TABLE [dbo].[fuseguard_log] (
    [id]               INT            IDENTITY (1, 1) NOT NULL,
    [threat_level]     INT            NULL,
    [filter_name]      NVARCHAR (50)  NULL,
    [message]          NVARCHAR (255) NULL,
    [detail]           NTEXT          NULL,
    [request_method]   VARCHAR (10)   NULL,
    [script_name]      NVARCHAR (255) NULL,
    [user_agent]       NVARCHAR (255) NULL,
    [ip_address]       VARCHAR (40)   NULL,
    [blocked]          INT            NULL,
    [request_date]     DATETIME       NULL,
    [request_host]     VARCHAR (128)  NULL,
    [request_port]     INT            NULL,
    [request_https]    INT            NULL,
    [filter_component] VARCHAR (128)  NULL,
    [threat_category]  NVARCHAR (16)  NULL,
    [filter_instance]  VARCHAR (50)   NULL,
    [query_string]     NTEXT          NULL,
    [http_referer]     NTEXT          NULL,
    PRIMARY KEY CLUSTERED ([id] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);

