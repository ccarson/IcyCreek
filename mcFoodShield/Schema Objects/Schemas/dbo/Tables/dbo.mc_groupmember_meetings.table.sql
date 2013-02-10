CREATE TABLE [dbo].[mc_groupmember_meetings] (
    [id]         INT IDENTITY (4684, 1) NOT NULL,
    [meeting_id] INT NOT NULL,
    [group_id]   INT NOT NULL,
    [user_id]    INT NOT NULL
);

