CREATE TABLE [dbo].[ReportDataTypes] (
    [reportDataTypesID] INT            IDENTITY (1, 1) NOT NULL,
    [dataType]          NVARCHAR (10)  NOT NULL,
    [dataLevel]         NVARCHAR (10)  NOT NULL,
    [description]       NVARCHAR (100) NOT NULL,
    [openingSyntax]     NVARCHAR (50)  NULL,
    [selectSyntax]      NVARCHAR (50)  NULL,
    [closingSyntax]     NVARCHAR (50)  NULL,
    [cdCreatedBy]       INT            NOT NULL,
    [cdCreatedOn]       DATETIME2 (0)  NOT NULL,
    [cdUpdatedBy]       INT            NULL,
    [cdUpdatedOn]       DATETIME2 (0)  NULL,
    [cdChangeReason]    NVARCHAR (50)  NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Contains meta-data about questions and response options that appear in a report.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportDataTypes';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Created User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportDataTypes', @level2type = N'COLUMN', @level2name = N'cdCreatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Created Timestamp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportDataTypes', @level2type = N'COLUMN', @level2name = N'cdCreatedOn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Updated User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportDataTypes', @level2type = N'COLUMN', @level2name = N'cdUpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Updated Timestamp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportDataTypes', @level2type = N'COLUMN', @level2name = N'cdUpdatedOn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Reason Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportDataTypes', @level2type = N'COLUMN', @level2name = N'cdChangeReason';

