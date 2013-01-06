CREATE TABLE [dbo].[transitionIdentities] (
    [id]                  UNIQUEIDENTIFIER NOT NULL,
    [transitionSystemsID] INT              NOT NULL,
    [convertedTableID]    INT              NOT NULL,
    [legacyID]            INT              NOT NULL
);

