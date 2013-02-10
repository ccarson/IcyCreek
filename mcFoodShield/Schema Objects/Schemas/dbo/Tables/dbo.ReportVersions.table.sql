CREATE TABLE [dbo].[ReportVersions] (
    [reportVersionsID] UNIQUEIDENTIFIER NOT NULL,
    [reportsID]        UNIQUEIDENTIFIER NOT NULL,
    [versionCode]      NVARCHAR (50)    NOT NULL,
    [description]      NVARCHAR (500)   NULL,
    [effectiveDate]    DATETIME2 (0)    NULL,
    [expirationDate]   DATETIME2 (0)    NULL,
    [isActive]         BIT              NOT NULL,
    [pdfTemplateName]  NVARCHAR (100)   NULL,
    [cdCreatedBy]      INT              NOT NULL,
    [cdCreatedOn]      DATETIME2 (0)    NOT NULL,
    [cdUpdatedBy]      INT              NULL,
    [cdUpdatedOn]      DATETIME2 (0)    NULL,
    [cdChangeReason]   NVARCHAR (50)    NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Contains versions for each report.  Each time the structure of a report is modified, a new version is created.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportVersions';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'( FK ) reportID to which reportVersions are associated', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportVersions', @level2type = N'COLUMN', @level2name = N'reportsID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'version code for the report', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportVersions', @level2type = N'COLUMN', @level2name = N'versionCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'description of the report version', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportVersions', @level2type = N'COLUMN', @level2name = N'description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'effective date of report version ( responses using this version cannot be created before this date )', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportVersions', @level2type = N'COLUMN', @level2name = N'effectiveDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'expiration date of report version ( responses using this report version cannot be created after expiration date )', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportVersions', @level2type = N'COLUMN', @level2name = N'expirationDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Created User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportVersions', @level2type = N'COLUMN', @level2name = N'cdCreatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Created Timestamp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportVersions', @level2type = N'COLUMN', @level2name = N'cdCreatedOn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Updated User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportVersions', @level2type = N'COLUMN', @level2name = N'cdUpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Updated Timestamp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportVersions', @level2type = N'COLUMN', @level2name = N'cdUpdatedOn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Reason Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportVersions', @level2type = N'COLUMN', @level2name = N'cdChangeReason';

