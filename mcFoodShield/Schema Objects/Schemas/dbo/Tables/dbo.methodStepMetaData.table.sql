CREATE TABLE [dbo].[methodStepMetaData] (
    [ID]        INT           IDENTITY (1, 1) NOT NULL,
    [StepLevel] NVARCHAR (1)  NOT NULL,
    [StepID]    INT           NOT NULL,
    [MetaData]  NVARCHAR (50) NOT NULL
);

