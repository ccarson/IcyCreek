CREATE TABLE [dbo].[mc_groups_sharedfeatures] (
    [id]          INT  IDENTITY (1, 1) NOT NULL,
    [ifeature_id] INT  NOT NULL,
    [isharedfrom] INT  NOT NULL,
    [isharedto]   INT  NOT NULL,
    [bactive]     BIT  NOT NULL,
    [dtCreated]   DATE NOT NULL,
    [iCreatedBy]  INT  NOT NULL
);

