CREATE TABLE [dbo].[ReportGroupQuestions] (
    [reportGroupQuestionsID] UNIQUEIDENTIFIER NOT NULL,
    [reportGroupsID]         UNIQUEIDENTIFIER NOT NULL,
    [reportDataTypesID]      INT              NOT NULL,
    [label]                  NVARCHAR (MAX)   NULL,
    [reportColumnLabel]      NVARCHAR (200)   NULL,
    [instructions]           NVARCHAR (MAX)   NULL,
    [displayOrder]           INT              NOT NULL,
    [isRequired]             BIT              NOT NULL,
    [validateAs]             NVARCHAR (100)   NOT NULL,
    [allowUserOptions]       BIT              NOT NULL,
    [hasSkipLogic]           BIT              NOT NULL,
    [isSummaryQuestion]      BIT              NOT NULL,
    [cdCreatedBy]            INT              NOT NULL,
    [cdCreatedOn]            DATETIME2 (0)    NOT NULL,
    [cdUpdatedBy]            INT              NULL,
    [cdUpdatedOn]            DATETIME2 (0)    NULL,
    [cdChangeReason]         NVARCHAR (50)    NULL,
    [active]                 BIT              NULL,
    [reportValue]            NCHAR (200)      NULL,
    [DisplayOnPage]          INT              NOT NULL,
    [questLayout]            NVARCHAR (50)    NULL,
    [QuestionWieght]         MONEY            CONSTRAINT [DF_ReportGroupQuestions_QuestionWieght] DEFAULT ((0)) NOT NULL,
    [isHidden]               BIT              DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_ReportGroupQuestions] PRIMARY KEY CLUSTERED ([reportGroupQuestionsID] ASC),
    CONSTRAINT [FK_ReportGroupQuestions_ReportGroups] FOREIGN KEY ([reportGroupsID]) REFERENCES [dbo].[ReportGroups] ([reportGroupsID]),
    CONSTRAINT [FK_ReportGroupQuestions_responseTypes] FOREIGN KEY ([reportDataTypesID]) REFERENCES [dbo].[ReportDataTypes] ([reportDataTypesID])
);




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Contains individual questions inside a given report group.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportGroupQuestions';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Created User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportGroupQuestions', @level2type = N'COLUMN', @level2name = N'cdCreatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Created Timestamp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportGroupQuestions', @level2type = N'COLUMN', @level2name = N'cdCreatedOn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Updated User ID', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportGroupQuestions', @level2type = N'COLUMN', @level2name = N'cdUpdatedBy';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Updated Timestamp', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportGroupQuestions', @level2type = N'COLUMN', @level2name = N'cdUpdatedOn';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'change data capture Reason Code', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ReportGroupQuestions', @level2type = N'COLUMN', @level2name = N'cdChangeReason';

