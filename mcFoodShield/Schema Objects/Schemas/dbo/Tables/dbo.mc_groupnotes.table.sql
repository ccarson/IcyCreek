CREATE TABLE [dbo].[mc_groupnotes] (
    [id]         INT            IDENTITY (1, 1) NOT NULL,
    [igroup_id]  INT            NOT NULL,
    [scontent]   NVARCHAR (255) NOT NULL,
    [dCreatedOn] DATETIME2 (0)  NOT NULL,
    [icreatedby] INT            NOT NULL,
    [bactive]    BIT            NOT NULL
);

