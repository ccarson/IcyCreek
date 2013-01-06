CREATE TABLE [dbo].[cal_action] (
    [id]                INT           IDENTITY (1, 1) NOT NULL,
    [displayid]         INT           NOT NULL,
    [taskid]            INT           NOT NULL,
    [actiondescription] NVARCHAR (50) NULL,
    [parentid]          INT           NOT NULL,
    [actionitemid]      INT           NOT NULL,
    [actionsubj]        NVARCHAR (50) NULL,
    [datedue]           DATETIME2 (0) NULL,
    [statusid]          INT           NOT NULL,
    [leaduserid]        INT           NOT NULL,
    [active]            BIT           NOT NULL,
    [actioneeuserID]    INT           NOT NULL,
    [prevactitemid]     INT           NOT NULL,
    [subactionOID]      INT           NOT NULL,
    [dateopened]        DATETIME2 (0) NOT NULL,
    [dateclosed]        DATETIME2 (0) NULL,
    [addedby]           INT           NOT NULL,
    [dateAdded]         DATETIME2 (0) NOT NULL,
    [cal_id]            INT           NOT NULL
);

