CREATE TABLE [dbo].[MethodReferenceDataTypes] (
    [ID]                 INT            IDENTITY (1, 1) NOT NULL,
    [Label]              VARCHAR (50)   NOT NULL,
    [StepLevel]          VARCHAR (1)    NOT NULL,
    [FrontEndIncPage]    VARCHAR (200)  NULL,
    [BackEndIncAddPage]  VARCHAR (200)  NULL,
    [BackEndIncListPage] NVARCHAR (200) NULL,
    [ForMethodTypes]     NVARCHAR (10)  NULL
);

