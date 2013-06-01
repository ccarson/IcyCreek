CREATE TABLE [dbo].[mc_groups_publicpages] (
    [id]         INT            IDENTITY (1, 1) NOT NULL,
    [bactive]    BIT            NOT NULL,
    [scontent]   NVARCHAR (MAX) NULL,
    [igroup_id]  INT            NOT NULL,
    [iPageType]  INT            NOT NULL,
    [dCreatedOn] DATETIME2 (0)  NOT NULL,
    [iCreatedBy] INT            NOT NULL
);

