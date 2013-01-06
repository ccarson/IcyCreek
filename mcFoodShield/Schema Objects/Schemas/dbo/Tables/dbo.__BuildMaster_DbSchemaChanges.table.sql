CREATE TABLE [dbo].[__BuildMaster_DbSchemaChanges] (
    [Numeric_Release_Number] BIGINT        NOT NULL,
    [Script_Id]              INT           NOT NULL,
    [Script_Sequence]        INT           NOT NULL,
    [Batch_Name]             NVARCHAR (50) NOT NULL,
    [Executed_Date]          DATETIME      NOT NULL,
    [Success_Indicator]      CHAR (1)      NOT NULL
);

