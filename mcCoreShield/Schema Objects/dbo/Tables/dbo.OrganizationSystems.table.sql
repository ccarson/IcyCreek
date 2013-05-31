CREATE TABLE [dbo].[OrganizationSystems] (
    [id]                 UNIQUEIDENTIFIER NOT NULL,
    [systemID]           INT              NOT NULL,
    [organizationTypeID] INT              NOT NULL,
    [verticalID]         INT              NOT NULL,
    [createdOn]          DATETIME2 (7)    NULL,
    [createdBy]          UNIQUEIDENTIFIER NULL,
    [updatedOn]          DATETIME2 (7)    NULL,
    [updatedBy]          UNIQUEIDENTIFIER NULL,
    [mc_organizationID]  INT              NOT NULL,
    CONSTRAINT [PK_OrganizationSystems] PRIMARY KEY CLUSTERED ([id] ASC, [systemID] ASC),
    CONSTRAINT [FK_OrganizationSystems_Organizations] FOREIGN KEY ([id]) REFERENCES [dbo].[Organizations] ([id]),
    CONSTRAINT [FK_OrganizationSystems_Systems] FOREIGN KEY ([systemID]) REFERENCES [Reference].[Systems] ([id])
);




GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_OrganizationSystems_PortalID]
    ON [dbo].[OrganizationSystems]([systemID] ASC, [mc_organizationID] ASC)
    INCLUDE([id]);

