CREATE TABLE [dbo].[mc_groups_features] (
    [id]          INT           IDENTITY (1, 1) NOT NULL,
    [group_id]    INT           NOT NULL,
    [app_id]      INT           NOT NULL,
    [active]      BIT           NOT NULL,
    [expires]     DATETIME2 (0) NULL,
    [CreatedOn]   DATETIME2 (0) NOT NULL,
    [bAllowShare] BIT           NOT NULL
);

