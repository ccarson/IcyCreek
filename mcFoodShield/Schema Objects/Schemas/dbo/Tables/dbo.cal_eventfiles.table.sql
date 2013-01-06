CREATE TABLE [dbo].[cal_eventfiles] (
    [FileID]  INT            IDENTITY (1, 1) NOT NULL,
    [EventID] INT            NULL,
    [NewsID]  INT            NULL,
    [Caption] NVARCHAR (255) NULL,
    [Path]    NVARCHAR (255) NULL
);

