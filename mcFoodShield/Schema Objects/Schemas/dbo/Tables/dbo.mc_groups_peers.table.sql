CREATE TABLE [dbo].[mc_groups_peers] (
    [id]           INT IDENTITY (3, 1) NOT NULL,
    [group_id]     INT NOT NULL,
    [user_id]      INT NOT NULL,
    [minigroup_id] INT NOT NULL
);

