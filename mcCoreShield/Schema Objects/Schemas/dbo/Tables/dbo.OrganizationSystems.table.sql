CREATE TABLE [dbo].[OrganizationSystems] (
    [id]                 UNIQUEIDENTIFIER NOT NULL,
    [systemID]           INT              NOT NULL,
    [organizationTypeID] INT              NOT NULL,
    [verticalID]         INT              NOT NULL,
    [createdOn]          DATETIME2 (7)    NOT NULL,
    [createdBy]          UNIQUEIDENTIFIER NOT NULL,
    [updatedOn]          DATETIME2 (7)    NULL,
    [updatedBy]          UNIQUEIDENTIFIER NULL,
    [mc_organizationID]  INT              NOT NULL
);

