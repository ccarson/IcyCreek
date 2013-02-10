CREATE TABLE [dbo].[ReportWatchList] (
    [id]            INT              IDENTITY (1, 1) NOT NULL,
    [reportsID]     UNIQUEIDENTIFIER NOT NULL,
    [userID]        INT              NOT NULL,
    [title]         NVARCHAR (100)   NOT NULL,
    [information]   NVARCHAR (100)   NOT NULL,
    [isActive]      BIT              NOT NULL,
    [alertRate]     INT              NOT NULL,
    [alertLastSent] DATETIME         NULL
);

