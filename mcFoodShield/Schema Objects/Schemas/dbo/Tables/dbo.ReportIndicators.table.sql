CREATE TABLE [dbo].[ReportIndicators] (
    [reportIndicatorID] UNIQUEIDENTIFIER DEFAULT (newsequentialid()) NOT NULL,
    [title]             NVARCHAR (500)   NULL,
    [description]       NVARCHAR (500)   NULL,
    [cdCreatedBy]       INT              NOT NULL,
    [cdCreatedOn]       DATETIME2 (0)    NOT NULL,
    [cdUpdatedBy]       INT              NULL,
    [cdUpdatedOn]       DATETIME2 (0)    NULL,
    [cdChangeReason]    NVARCHAR (50)    NULL,
    [active]            BIT              DEFAULT ((1)) NULL,
    [ReportsID]         UNIQUEIDENTIFIER NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ReportGroups contain a collection of questions that appear on a report.  
ReportIndicators can repeat on a report.  
A Report question will be assigned an report indicator that will be used for reporting purposes', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportIndicators';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Created User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportIndicators', @level2type = N'COLUMN', @level2name = N'cdCreatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Created Timestamp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportIndicators', @level2type = N'COLUMN', @level2name = N'cdCreatedOn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Updated User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportIndicators', @level2type = N'COLUMN', @level2name = N'cdUpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Updated Timestamp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportIndicators', @level2type = N'COLUMN', @level2name = N'cdUpdatedOn';

