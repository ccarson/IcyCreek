CREATE TABLE [dbo].[ReportOptionTemplates] (
    [reportOptionTemplatesID]   UNIQUEIDENTIFIER NOT NULL,
    [reportQuestionTemplatesID] UNIQUEIDENTIFIER NOT NULL,
    [reportDataTypesID]         INT              NOT NULL,
    [label]                     NVARCHAR (50)    NULL,
    [storedValue]               NVARCHAR (50)    NULL,
    [displayOrder]              INT              NOT NULL,
    [secondLabel]               NVARCHAR (50)    NULL,
    [isDefault]                 BIT              NOT NULL,
    [isAutoSuggest]             BIT              NOT NULL
);

