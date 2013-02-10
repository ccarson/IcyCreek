CREATE TABLE [dbo].[mc_groups_tags] (
    [id]          INT           IDENTITY (7, 1) NOT NULL,
    [tag]         NVARCHAR (50) NOT NULL,
    [icreatedby]  INT           NOT NULL,
    [igroup_id]   INT           NOT NULL,
    [datecreated] DATETIME2 (0) NULL
);

