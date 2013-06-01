CREATE TABLE [dbo].[methodStepActionDownloads] (
    [id]                  INT           IDENTITY (1, 1) NOT NULL,
    [methodStepActionsID] INT           NOT NULL,
    [userID]              INT           NOT NULL,
    [dowloaded]           DATETIME2 (7) NOT NULL
);

