CREATE TABLE [dbo].[mtsch_times] (
    [mtsch_TimeID]  INT          IDENTITY (759, 1) NOT NULL,
    [mtsch_DateFK]  INT          NOT NULL,
    [mtsch_TimeVal] VARCHAR (20) NULL,
    [mtsch_PollFK]  INT          NOT NULL,
    [mtsch_Order]   INT          NULL
);

