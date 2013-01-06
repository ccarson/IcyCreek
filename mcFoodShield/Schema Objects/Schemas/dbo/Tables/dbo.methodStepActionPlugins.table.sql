CREATE TABLE [dbo].[methodStepActionPlugins] (
    [id]                  INT IDENTITY (1, 1) NOT NULL,
    [methodStepActionsID] INT NOT NULL,
    [methodXPluginsID]    INT NOT NULL,
    [displayOrder]        INT NOT NULL
);

