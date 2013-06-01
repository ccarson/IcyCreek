CREATE TABLE [dbo].[h_articles] (
    [id]            INT            IDENTITY (1, 1) NOT NULL,
    [isection_id]   INT            NOT NULL,
    [sarticle_name] NVARCHAR (75)  NOT NULL,
    [sarticle]      NVARCHAR (MAX) NOT NULL,
    [icreatedby]    INT            NOT NULL,
    [dtcreated]     DATETIME2 (0)  NOT NULL,
    [bactive]       BIT            NOT NULL
);

