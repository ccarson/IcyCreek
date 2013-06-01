CREATE TABLE [dbo].[ReportVersionFields] (
    [reportVersionFieldsID] UNIQUEIDENTIFIER NOT NULL,
    [reportVersionsID]      UNIQUEIDENTIFIER NOT NULL,
    [name]                  NVARCHAR (500)   NOT NULL,
    [cdCreatedBy]           INT              NOT NULL,
    [cdCreatedOn]           DATETIME2 (0)    NOT NULL,
    [cdUpdatedBy]           INT              NULL,
    [cdUpdatedOn]           DATETIME2 (0)    NULL,
    [cdChangeReason]        NVARCHAR (50)    NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Meta-data about individual static fields that appear on a report.  Data that appears in a report header, such as approval codes, form numbers, etc.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportVersionFields';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'( FK ) reportVersion to which fields are associated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportVersionFields', @level2type = N'COLUMN', @level2name = N'reportVersionsID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'report field name', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportVersionFields', @level2type = N'COLUMN', @level2name = N'name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Created User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportVersionFields', @level2type = N'COLUMN', @level2name = N'cdCreatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Created Timestamp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportVersionFields', @level2type = N'COLUMN', @level2name = N'cdCreatedOn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Updated User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportVersionFields', @level2type = N'COLUMN', @level2name = N'cdUpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Updated Timestamp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportVersionFields', @level2type = N'COLUMN', @level2name = N'cdUpdatedOn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Reason Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportVersionFields', @level2type = N'COLUMN', @level2name = N'cdChangeReason';

