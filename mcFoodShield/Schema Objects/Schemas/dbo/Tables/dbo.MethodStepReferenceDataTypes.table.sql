CREATE TABLE [dbo].[MethodStepReferenceDataTypes] (
    [ID]                 INT            IDENTITY (1, 1) NOT NULL,
    [Label]              NVARCHAR (50)  NOT NULL,
    [StepLevel]          NVARCHAR (1)   NOT NULL,
    [FrontEndIncPage]    NVARCHAR (200) NULL,
    [BackEndIncAddPage]  NVARCHAR (200) NULL,
    [BackEndIncListPage] NVARCHAR (200) NULL,
    [ForMethodTypes]     NVARCHAR (10)  NULL
);

