CREATE TABLE [dbo].[tblmeeting] (
    [meetingId]    INT           IDENTITY (55, 1) NOT NULL,
    [name]         VARCHAR (35)  NOT NULL,
    [startDate]    DATETIME2 (0) NOT NULL,
    [endDate]      DATETIME2 (0) NOT NULL,
    [description]  VARCHAR (MAX) NOT NULL,
    [instructions] VARCHAR (MAX) NOT NULL,
    [group_id]     INT           NOT NULL
);

