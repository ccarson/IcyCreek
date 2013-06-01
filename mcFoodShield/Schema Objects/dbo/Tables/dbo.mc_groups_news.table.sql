CREATE TABLE [dbo].[mc_groups_news] (
    [id]        INT            IDENTITY (85, 1) NOT NULL,
    [headline]  NVARCHAR (150) NOT NULL,
    [newsbody]  NVARCHAR (MAX) NOT NULL,
    [user_id]   INT            NOT NULL,
    [dtCreated] DATETIME       NOT NULL,
    [group_id]  INT            NOT NULL
);

