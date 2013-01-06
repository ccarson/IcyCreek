CREATE TABLE [dbo].[methodStepActionRelations] (
    [id]                  INT IDENTITY (1, 1) NOT NULL,
    [methodStepActionsID] INT NOT NULL,
    [relatedActionsID]    INT NULL,
    [relatedStepID]       INT NULL
);

