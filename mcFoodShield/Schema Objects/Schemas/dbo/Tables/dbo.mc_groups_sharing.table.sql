CREATE TABLE [dbo].[mc_groups_sharing] (
    [id]          INT           IDENTITY (28, 1) NOT NULL,
    [igroup_id]   INT           NOT NULL,
    [ifeature_id] INT           NOT NULL,
    [dtcreated]   DATETIME2 (0) NULL,
    [icreatedby]  INT           NOT NULL
);

