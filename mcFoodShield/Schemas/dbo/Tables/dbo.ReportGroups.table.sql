CREATE TABLE [dbo].[ReportGroups] (
    [reportGroupsID]     UNIQUEIDENTIFIER NOT NULL,
    [reportVersionsID]   UNIQUEIDENTIFIER NOT NULL,
    [title]              NVARCHAR (500)   NULL,
    [instructions]       NVARCHAR (1000)  NULL,
    [description]        NVARCHAR (1000)  NULL,
    [displayOrder]       INT              NOT NULL,
    [responsesIDLabel]   NVARCHAR (500)   NULL,
    [questionLayout]     NVARCHAR (500)   NULL,
    [printLayoutMaximum] INT              NOT NULL,
    [buttonLabel]        NVARCHAR (500)   NULL,
    [cdCreatedBy]        INT              NOT NULL,
    [cdCreatedOn]        DATETIME2 (0)    NOT NULL,
    [cdUpdatedBy]        INT              NULL,
    [cdUpdatedOn]        DATETIME2 (0)    NULL,
    [cdChangeReason]     NVARCHAR (50)    NULL,
    [active]             BIT              NULL,
    [ForReporting]       BIT              NOT NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ReportGroups contain a collection of questions that appear on a report.  
ReportGroups can repeat on a report.  
Consider a persons'' resume.  
One report group could contain the collection of non-repeating questions.  Name, Date of Birth, email address, etc.  
Another report group can contain the repeating questions that would appear ( a list of the persons jobs, that would include the questions such as name of employer, employment dates, job descriptions ). 
Another group would contain educational data ( name of school, dates attended, degrees awarded ).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportGroups';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportGroups', @level2type = N'COLUMN', @level2name = N'instructions';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Created User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportGroups', @level2type = N'COLUMN', @level2name = N'cdCreatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Created Timestamp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportGroups', @level2type = N'COLUMN', @level2name = N'cdCreatedOn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Updated User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportGroups', @level2type = N'COLUMN', @level2name = N'cdUpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Updated Timestamp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportGroups', @level2type = N'COLUMN', @level2name = N'cdUpdatedOn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Reason Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportGroups', @level2type = N'COLUMN', @level2name = N'cdChangeReason';

