CREATE TABLE [dbo].[content_mc_organization] (
    [ID]           INT            IDENTITY (1119, 1) NOT NULL,
    [Name]         NVARCHAR (255) NULL,
    [Website]      NVARCHAR (255) NULL,
    [Status]       NVARCHAR (50)  NULL,
    [Summary]      NVARCHAR (MAX) NULL,
    [type_id]      INT            NOT NULL,
    [vertical_id]  INT            NOT NULL,
    [active]       BIT            NOT NULL,
    [date_added]   DATETIME2 (7)  NULL,
    [added_by]     INT            NOT NULL,
    [date_updated] DATETIME2 (7)  NULL,
    [updated_by]   INT            NOT NULL,
    [is_demo]      BIT            NULL,
    [temp]         BIT            NOT NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);

