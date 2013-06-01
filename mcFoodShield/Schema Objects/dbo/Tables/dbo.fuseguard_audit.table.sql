CREATE TABLE [dbo].[fuseguard_audit] (
    [id]                INT            IDENTITY (1, 1) NOT NULL,
    [user_id]           INT            NOT NULL,
    [ip_address]        VARCHAR (40)   NOT NULL,
    [event_date]        DATETIME       NOT NULL,
    [event_type]        NVARCHAR (20)  NOT NULL,
    [event_description] NVARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);

