CREATE TABLE [dbo].[ContactOrgRoles] (
    [id]               UNIQUEIDENTIFIER NOT NULL,
    [contactsID]       UNIQUEIDENTIFIER NOT NULL,
    [organizationsID]  UNIQUEIDENTIFIER NOT NULL,
    [orgDepartmentsID] UNIQUEIDENTIFIER NULL,
    [rolesID]          UNIQUEIDENTIFIER NOT NULL,
    [isHead]           BIT              NOT NULL,
    [dateAdded]        DATETIME2 (0)    NULL,
    [addedBy]          UNIQUEIDENTIFIER NULL,
    [dateUpdated]      DATETIME2 (0)    NULL,
    [updatedBy]        UNIQUEIDENTIFIER NULL
);

