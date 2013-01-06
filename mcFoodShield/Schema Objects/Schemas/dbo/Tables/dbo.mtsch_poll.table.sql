CREATE TABLE [dbo].[mtsch_poll] (
    [mtsch_PollID]      INT           IDENTITY (101, 1) NOT NULL,
    [mtsch_userID]      INT           NOT NULL,
    [mtsch_Title]       VARCHAR (75)  NULL,
    [mtsch_Description] VARCHAR (MAX) NULL,
    [mtsch_group_id]    INT           NOT NULL,
    [status]            BIT           NOT NULL
);

