CREATE TABLE [dbo].[mc_groupmembers_customvalues] (
    [id]            INT           IDENTITY (1, 1) NOT NULL,
    [field_id]      INT           NOT NULL,
    [gm_id]         INT           NOT NULL,
    [field_value]   NVARCHAR (50) NULL,
    [limiter_value] NVARCHAR (50) NULL
);

