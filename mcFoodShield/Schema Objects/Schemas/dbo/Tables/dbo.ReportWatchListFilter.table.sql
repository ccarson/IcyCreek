CREATE TABLE [dbo].[ReportWatchListFilter] (
    [id]                     INT              IDENTITY (1, 1) NOT NULL,
    [reportWatchListID]      INT              NOT NULL,
    [reportGroupsID]         UNIQUEIDENTIFIER NOT NULL,
    [reportGroupQuestionsID] UNIQUEIDENTIFIER NOT NULL,
    [reportGroupOptionsID]   UNIQUEIDENTIFIER NOT NULL,
    [valuesDataType]         NVARCHAR (1)     NULL,
    [condition]              NVARCHAR (10)    NULL,
    [value1]                 NVARCHAR (50)    NULL,
    [value2]                 NVARCHAR (50)    NULL
);

