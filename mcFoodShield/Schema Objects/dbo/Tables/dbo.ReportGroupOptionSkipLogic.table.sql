CREATE TABLE [dbo].[ReportGroupOptionSkipLogic] (
    [reportOptionSkipLogicID] UNIQUEIDENTIFIER NOT NULL,
    [reportGroupOptionsID]    UNIQUEIDENTIFIER NOT NULL,
    [actions]                 NVARCHAR (1)     NOT NULL,
    [reportGroupsID]          UNIQUEIDENTIFIER NULL,
    [reportGroupQuestionsID]  UNIQUEIDENTIFIER NULL
);

