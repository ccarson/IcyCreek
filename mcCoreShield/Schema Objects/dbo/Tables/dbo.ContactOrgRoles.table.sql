CREATE TABLE [dbo].[ContactOrgRoles] (
    [id]               UNIQUEIDENTIFIER NOT NULL,
    [contactsID]       UNIQUEIDENTIFIER NOT NULL,
    [organizationsID]  UNIQUEIDENTIFIER NOT NULL,
    [orgDepartmentsID] UNIQUEIDENTIFIER NULL,
    [rolesID]          UNIQUEIDENTIFIER NOT NULL,
    [isHead]           BIT              NOT NULL,
    [createdOn]        DATETIME2 (7)    NULL,
    [createdBy]        UNIQUEIDENTIFIER NULL,
    [updatedOn]        DATETIME2 (7)    NULL,
    [updatedBy]        UNIQUEIDENTIFIER NULL,
    CONSTRAINT [PK_ContactOrgRoles] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_ContactOrgRoles_Contacts] FOREIGN KEY ([contactsID]) REFERENCES [dbo].[Contacts] ([ID]),
    CONSTRAINT [FK_ContactOrgRoles_Organizations] FOREIGN KEY ([organizationsID]) REFERENCES [dbo].[Organizations] ([id]),
    CONSTRAINT [FK_ContactOrgRoles_Roles] FOREIGN KEY ([rolesID]) REFERENCES [dbo].[Roles] ([id])
);




GO
CREATE NONCLUSTERED INDEX [ContactsOrgRoles_Role]
    ON [dbo].[ContactOrgRoles]([rolesID] ASC);


GO
CREATE NONCLUSTERED INDEX [ContactsOrgRoles_OrgDepartment]
    ON [dbo].[ContactOrgRoles]([orgDepartmentsID] ASC);


GO
CREATE NONCLUSTERED INDEX [ContactsOrgRoles_Organization]
    ON [dbo].[ContactOrgRoles]([organizationsID] ASC);


GO
CREATE NONCLUSTERED INDEX [ContactsOrgRoles_Contact]
    ON [dbo].[ContactOrgRoles]([contactsID] ASC);

