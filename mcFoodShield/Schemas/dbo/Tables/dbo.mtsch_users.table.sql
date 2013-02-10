CREATE TABLE [dbo].[mtsch_users] (
    [id]                 INT            IDENTITY (1069, 1) NOT NULL,
    [mtsch_userID]       INT            NOT NULL,
    [mtsch_groupID]      INT            NOT NULL,
    [mtsch_pollIDFK]     INT            NOT NULL,
    [mtsch_userLevel]    NVARCHAR (255) NULL,
    [mtsch_userRequired] BIT            NOT NULL,
    [mtsch_answered]     BIT            NOT NULL,
    [mtsch_dateAdded]    DATETIME2 (0)  NULL
);

