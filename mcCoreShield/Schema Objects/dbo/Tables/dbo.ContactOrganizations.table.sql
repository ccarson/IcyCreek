CREATE TABLE [dbo].[ContactOrganizations] (
    [ID]                 UNIQUEIDENTIFIER NOT NULL,
    [contactsID]         UNIQUEIDENTIFIER NOT NULL,
    [organizationsID]    UNIQUEIDENTIFIER NOT NULL,
    [orgDepartmentsID]   UNIQUEIDENTIFIER NULL,
    [orgLocationsID]     UNIQUEIDENTIFIER NULL,
    [isDefault]          BIT              NULL,
    [isChosen]           BIT              NULL,
    [isEmergencyContact] BIT              NULL,
    [createdOn]          DATETIME2 (7)    NULL,
    [createdBy]          UNIQUEIDENTIFIER NULL,
    [updatedOn]          DATETIME2 (7)    NULL,
    [updatedBy]          UNIQUEIDENTIFIER NULL,
    CONSTRAINT [PK_ContactOrganizations] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ContactOrganizations_Contacts] FOREIGN KEY ([contactsID]) REFERENCES [dbo].[Contacts] ([ID]),
    CONSTRAINT [FK_ContactOrganizations_Organizations] FOREIGN KEY ([organizationsID]) REFERENCES [dbo].[Organizations] ([id]),
    CONSTRAINT [FK_ContactOrganizations_OrgDepartments] FOREIGN KEY ([orgDepartmentsID]) REFERENCES [dbo].[OrgDepartments] ([id]),
    CONSTRAINT [FK_ContactOrganizations_OrgLocations] FOREIGN KEY ([orgLocationsID]) REFERENCES [dbo].[OrgLocations] ([id])
);




GO
CREATE NONCLUSTERED INDEX [IX_ContactOrganizations_Organization]
    ON [dbo].[ContactOrganizations]([organizationsID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ContactOrganizations_Location]
    ON [dbo].[ContactOrganizations]([orgLocationsID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ContactOrganizations_Department]
    ON [dbo].[ContactOrganizations]([orgDepartmentsID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ContactOrganizations_Contact]
    ON [dbo].[ContactOrganizations]([contactsID] ASC);

