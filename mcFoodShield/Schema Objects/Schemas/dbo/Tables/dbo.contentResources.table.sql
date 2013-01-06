CREATE TABLE [dbo].[contentResources] (
    [id]                  UNIQUEIDENTIFIER NOT NULL,
    [name]                NVARCHAR (500)   NOT NULL,
    [url]                 NVARCHAR (500)   NULL,
    [rights]              NVARCHAR (500)   NULL,
    [languages]           NVARCHAR (500)   NULL,
    [description]         NVARCHAR (MAX)   NULL,
    [otherInformation]    NVARCHAR (MAX)   NULL,
    [isActive]            BIT              NOT NULL,
    [created]             DATETIME2 (7)    NOT NULL,
    [createdBy]           INT              NOT NULL,
    [updated]             DATETIME2 (7)    NULL,
    [updatedBy]           INT              NULL,
    [Type]                NVARCHAR (1)     NOT NULL,
    [PublishedDate]       DATETIME2 (7)    NULL,
    [ResourceType]        NVARCHAR (50)    NULL,
    [ResourceDocument]    NVARCHAR (250)   NULL,
    [FinalServerFilename] NVARCHAR (250)   NULL
);

