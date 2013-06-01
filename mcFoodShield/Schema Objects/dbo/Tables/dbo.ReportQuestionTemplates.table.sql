CREATE TABLE [dbo].[ReportQuestionTemplates] (
    [reportQuestionTemplatesID] UNIQUEIDENTIFIER NOT NULL,
    [reportDataTypesID]         INT              NOT NULL,
    [label]                     NVARCHAR (200)   NOT NULL,
    [reportColumnLabel]         NVARCHAR (200)   NULL,
    [instructions]              NVARCHAR (2000)  NOT NULL,
    [displayOrder]              INT              NOT NULL,
    [isRequired]                BIT              NOT NULL,
    [validateAs]                NVARCHAR (100)   NOT NULL,
    [allowUserOptions]          BIT              NOT NULL,
    [hasSkipLogic]              BIT              NOT NULL,
    [isSummaryQuestion]         BIT              NOT NULL
);

