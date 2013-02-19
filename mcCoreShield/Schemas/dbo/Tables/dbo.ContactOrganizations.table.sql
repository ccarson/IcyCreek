CREATE TABLE [dbo].[ContactOrganizations] (
    [id]                 UNIQUEIDENTIFIER NOT NULL,
    [contactsID]         UNIQUEIDENTIFIER NOT NULL,
    [organizationsID]    UNIQUEIDENTIFIER NOT NULL,
    [orgDepartmentsID]   UNIQUEIDENTIFIER NULL,
    [orgLocationsID]     UNIQUEIDENTIFIER NULL,
    [isDefault]          BIT              NULL,
    [isChosen]           BIT              NULL,
    [isEmergencyContact] BIT              NULL,
    [dateAdded]          DATETIME2 (0)    NULL,
    [dateUpdated]        DATETIME2 (0)    NULL,
    CONSTRAINT [PK_ContactOrganizations] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_ContactOrganizations_Contacts] FOREIGN KEY ([contactsID]) REFERENCES [dbo].[Contacts] ([id]),
    CONSTRAINT [FK_ContactOrganizations_Organizations] FOREIGN KEY ([organizationsID]) REFERENCES [dbo].[Organizations] ([id])
);


GO
ALTER TABLE [dbo].[ContactOrganizations] NOCHECK CONSTRAINT [FK_ContactOrganizations_Contacts];



