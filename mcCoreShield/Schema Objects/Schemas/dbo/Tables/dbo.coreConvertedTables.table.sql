CREATE TABLE [dbo].[coreConvertedTables] (
    [id]                 INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [tableName]          NVARCHAR (50) NOT NULL,
    [newTableName]       NVARCHAR (50) NOT NULL,
    [isReady]            BIT           NOT NULL,
    [conversionSequence] INT           NULL
);

