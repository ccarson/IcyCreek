CREATE TABLE [dbo].[OrgLocationSystems] (
    [ID]                UNIQUEIDENTIFIER NOT NULL,
    [systemID]          INT              NOT NULL,
    [createdOn]         DATETIME2 (7)    NULL,
    [createdBy]         UNIQUEIDENTIFIER NULL,
    [updatedOn]         DATETIME2 (7)    NULL,
    [updatedBy]         UNIQUEIDENTIFIER NULL,
    [mc_org_locationID] INT              NOT NULL,
    CONSTRAINT [PK_OrgLocationSystems] PRIMARY KEY CLUSTERED ([ID] ASC, [systemID] ASC),
    CONSTRAINT [FK_OrgLocationsSystems_OrgLocations] FOREIGN KEY ([ID]) REFERENCES [dbo].[OrgLocations] ([id]),
    CONSTRAINT [FK_OrgLocationsSystems_Systems] FOREIGN KEY ([systemID]) REFERENCES [Reference].[Systems] ([id])
);


GO
CREATE NONCLUSTERED INDEX [IX_OrgLocationSystems]
    ON [dbo].[OrgLocationSystems]([systemID] ASC, [mc_org_locationID] ASC)
    INCLUDE([ID]);

