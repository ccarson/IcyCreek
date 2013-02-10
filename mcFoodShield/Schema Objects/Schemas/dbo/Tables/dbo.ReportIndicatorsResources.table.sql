CREATE TABLE [dbo].[ReportIndicatorsResources] (
    [id]                INT              IDENTITY (1, 1) NOT NULL,
    [contentType]       NVARCHAR (5)     NOT NULL,
    [numberValue]       INT              NOT NULL,
    [reportIndicatorID] UNIQUEIDENTIFIER NOT NULL,
    [contentID]         UNIQUEIDENTIFIER NOT NULL
);

