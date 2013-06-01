CREATE TABLE [dbo].[ContactOrgRoleSystems] (
    [ID]                    UNIQUEIDENTIFIER NOT NULL,
    [systemID]              INT              NOT NULL,
    [createdOn]             DATETIME2 (7)    NULL,
    [createdBy]             UNIQUEIDENTIFIER NULL,
    [updatedOn]             DATETIME2 (7)    NULL,
    [updatedBy]             UNIQUEIDENTIFIER NULL,
    [mc_contact_orgrolesID] INT              NOT NULL,
    CONSTRAINT [PK_ContactOrgRoleSystems] PRIMARY KEY CLUSTERED ([ID] ASC, [systemID] ASC),
    CONSTRAINT [FK_ContactOrgRoleSystems] FOREIGN KEY ([ID]) REFERENCES [dbo].[ContactOrgRoles] ([id]),
    CONSTRAINT [FK_ContactOrgRoleSystems_Systems] FOREIGN KEY ([systemID]) REFERENCES [Reference].[Systems] ([id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_ContactOrgRoleSystems]
    ON [dbo].[ContactOrgRoleSystems]([systemID] ASC, [mc_contact_orgrolesID] ASC)
    INCLUDE([ID]);

