CREATE TABLE [dbo].[mc_groups_connectmeetings] (
    [id]         INT           IDENTITY (452, 1) NOT NULL,
    [groupID]    INT           NOT NULL,
    [meetingID]  INT           NOT NULL,
    [active]     BIT           NOT NULL,
    [start_date] DATETIME2 (0) NULL,
    [end_date]   DATETIME2 (0) NULL
);

