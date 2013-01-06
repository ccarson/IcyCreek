CREATE TABLE [dbo].[plfSuppressionList] (
    [suppressionId]           INT            IDENTITY (1, 1) NOT NULL,
    [suppressionEmailAddress] NVARCHAR (255) NULL,
    [clientId]                INT            NULL
);

