CREATE TABLE [dbo].[mc_groups_custom] (
    [id]           INT           IDENTITY (4, 1) NOT NULL,
    [fieldname]    NVARCHAR (25) NOT NULL,
    [fieldtype]    NVARCHAR (25) NOT NULL,
    [limiter]      BIT           NOT NULL,
    [groupby]      BIT           NOT NULL,
    [readonly]     BIT           NOT NULL,
    [core_id]      INT           NOT NULL,
    [grouptype_id] INT           NOT NULL
);

