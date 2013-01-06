CREATE TABLE [dbo].[ContactOrganizations] (
    [id]                 UNIQUEIDENTIFIER NOT NULL,
    [contactsID]         UNIQUEIDENTIFIER NOT NULL,
    [organizationsID]    UNIQUEIDENTIFIER NOT NULL,
    [orgDepartmentsID]   UNIQUEIDENTIFIER NULL,
    [orgLocationsID]     UNIQUEIDENTIFIER NOT NULL,
    [isDefault]          BIT              NULL,
    [isChosen]           BIT              NULL,
    [isEmergencyContact] BIT              NULL,
    [dateAdded]          DATETIME2 (0)    NULL,
    [dateUpdated]        DATETIME2 (0)    NULL
);

