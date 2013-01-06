CREATE TABLE [dbo].[mc_groups_customvalues] (
    [id]            INT           IDENTITY (533, 1) NOT NULL,
    [field_id]      INT           NOT NULL,
    [group_id]      INT           NOT NULL,
    [field_value]   NVARCHAR (50) NOT NULL,
    [limiter_value] NVARCHAR (50) NULL
);

