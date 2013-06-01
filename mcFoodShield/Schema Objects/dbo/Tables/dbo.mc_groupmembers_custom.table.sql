CREATE TABLE [dbo].[mc_groupmembers_custom] (
    [id]        INT           IDENTITY (1, 1) NOT NULL,
    [limiter]   BIT           NOT NULL,
    [groupby]   BIT           NOT NULL,
    [fieldname] NVARCHAR (25) NOT NULL,
    [fieldtype] NVARCHAR (25) NOT NULL
);

