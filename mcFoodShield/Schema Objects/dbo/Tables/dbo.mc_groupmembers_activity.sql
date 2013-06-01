CREATE TABLE [dbo].[mc_groupmembers_activity] (
    [id]           INT      IDENTITY (1, 1) NOT NULL,
    [user_id]      INT      NOT NULL,
    [group_id]     INT      NOT NULL,
    [activityDate] DATETIME NOT NULL
);

