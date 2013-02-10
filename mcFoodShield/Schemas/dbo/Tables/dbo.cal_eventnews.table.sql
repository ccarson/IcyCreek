CREATE TABLE [dbo].[cal_eventnews] (
    [EventNewsID]  INT             IDENTITY (1, 1) NOT NULL,
    [NewsTitle]    NVARCHAR (255)  NULL,
    [NewsText]     NVARCHAR (MAX)  NULL,
    [NewsOrder]    INT             NULL,
    [NewsInactive] BIT             NOT NULL,
    [DateAdded]    DATETIME2 (0)   NULL,
    [LastUpdate]   DATETIME2 (0)   NULL,
    [upsize_ts]    VARBINARY (MAX) NULL
);

