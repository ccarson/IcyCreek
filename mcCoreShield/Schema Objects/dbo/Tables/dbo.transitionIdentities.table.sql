CREATE TABLE [dbo].[transitionIdentities] (
    [id]                  UNIQUEIDENTIFIER NOT NULL,
    [transitionSystemsID] INT              NOT NULL,
    [convertedTableID]    INT              NOT NULL,
    [legacyID]            INT              NOT NULL
);




GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_transitionIdentities]
    ON [dbo].[transitionIdentities]([transitionSystemsID] ASC, [convertedTableID] ASC, [legacyID] ASC)
    INCLUDE([id]);


GO
CREATE CLUSTERED INDEX [PK_transitionIdentities]
    ON [dbo].[transitionIdentities]([id] ASC, [transitionSystemsID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_transitionIdentitiesTableBySystem]
    ON [dbo].[transitionIdentities]([convertedTableID] ASC, [transitionSystemsID] ASC, [id] ASC)
    INCLUDE([legacyID]);


GO
CREATE NONCLUSTERED INDEX [IX_transitionIdentities_SystemByTable]
    ON [dbo].[transitionIdentities]([transitionSystemsID] ASC, [convertedTableID] ASC, [id] ASC)
    INCLUDE([legacyID]);

