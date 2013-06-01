CREATE TABLE [dbo].[mc_groups_peergroup] (
    [id]            INT            IDENTITY (7, 1) NOT NULL,
    [group_id]      INT            NOT NULL,
    [minigroupname] NVARCHAR (100) NOT NULL,
    [dtCreated]     DATETIME2 (0)  NOT NULL,
    [createdby]     INT            NOT NULL,
    [bactive]       BIT            NOT NULL,
    [listdesc]      NVARCHAR (200) NULL
);

