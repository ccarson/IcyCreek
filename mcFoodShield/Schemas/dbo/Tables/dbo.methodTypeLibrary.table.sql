CREATE TABLE [dbo].[methodTypeLibrary] (
    [ID]           INT           IDENTITY (1, 1) NOT NULL,
    [methodTypeID] INT           NOT NULL,
    [currentTerm]  NVARCHAR (50) NOT NULL,
    [replacedWith] NVARCHAR (50) NOT NULL
);

