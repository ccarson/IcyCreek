CREATE TABLE [dbo].[ReportGroupOptions] (
    [reportGroupOptionsID]   UNIQUEIDENTIFIER NOT NULL,
    [reportGroupQuestionsID] UNIQUEIDENTIFIER NOT NULL,
    [reportDataTypesID]      INT              NOT NULL,
    [label]                  NVARCHAR (500)   NULL,
    [storedValue]            NVARCHAR (500)   NULL,
    [displayOrder]           INT              NOT NULL,
    [secondLabel]            NVARCHAR (500)   NULL,
    [isDefault]              BIT              NOT NULL,
    [isAutoSuggest]          BIT              NOT NULL,
    [cdCreatedBy]            INT              NOT NULL,
    [cdCreatedOn]            DATETIME2 (0)    NOT NULL,
    [cdUpdatedBy]            INT              NULL,
    [cdUpdatedOn]            DATETIME2 (0)    NULL,
    [cdChangeReason]         NVARCHAR (50)    NULL,
    [bActive]                BIT              NULL,
    [reportValue]            NCHAR (200)      NULL,
    [ResponseScore]          INT              NOT NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Contains meta-data about the available answers for a given report group.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportGroupOptions';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Created User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportGroupOptions', @level2type = N'COLUMN', @level2name = N'cdCreatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Created Timestamp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportGroupOptions', @level2type = N'COLUMN', @level2name = N'cdCreatedOn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Updated User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportGroupOptions', @level2type = N'COLUMN', @level2name = N'cdUpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Updated Timestamp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportGroupOptions', @level2type = N'COLUMN', @level2name = N'cdUpdatedOn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Reason Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportGroupOptions', @level2type = N'COLUMN', @level2name = N'cdChangeReason';

