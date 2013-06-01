CREATE TABLE [dbo].[ContactOrgSystems] (
    [ID]                         UNIQUEIDENTIFIER NOT NULL,
    [systemID]                   INT              NOT NULL,
    [createdOn]                  DATETIME2 (7)    NULL,
    [createdBy]                  UNIQUEIDENTIFIER NULL,
    [updatedOn]                  DATETIME2 (7)    NULL,
    [updatedBy]                  UNIQUEIDENTIFIER NULL,
    [mc_contact_organizationsID] INT              NOT NULL,
    CONSTRAINT [PK_ContactOrgSystems] PRIMARY KEY CLUSTERED ([ID] ASC, [systemID] ASC),
    CONSTRAINT [FK_ContactOrgSystems] FOREIGN KEY ([ID]) REFERENCES [dbo].[ContactOrganizations] ([ID]),
    CONSTRAINT [FK_ContactOrgSystems_Systems] FOREIGN KEY ([systemID]) REFERENCES [Reference].[Systems] ([id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_ContactOrgSystems]
    ON [dbo].[ContactOrgSystems]([systemID] ASC, [mc_contact_organizationsID] ASC)
    INCLUDE([ID]);

