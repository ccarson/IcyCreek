CREATE TABLE [dbo].[MethodStepReferencedData] (
    [ID]                        INT           IDENTITY (1, 1) NOT NULL,
    [MethodReferenceDataTypeID] INT           NOT NULL,
    [StepLevel]                 NVARCHAR (1)  NOT NULL,
    [StepID]                    INT           NOT NULL,
    [ReferencedDataID]          INT           NOT NULL,
    [ReferencedDataTable]       NVARCHAR (50) NOT NULL
);

