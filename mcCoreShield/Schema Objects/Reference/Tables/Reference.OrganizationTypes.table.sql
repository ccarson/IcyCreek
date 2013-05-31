CREATE TABLE [Reference].[OrganizationTypes] (
    [id]                   INT           IDENTITY (1, 1) NOT NULL,
    [OrganizationTypeID]   INT           NOT NULL,
    [portalName]           NVARCHAR (20) NOT NULL,
    [OrganizationTypeName] NVARCHAR (50) NOT NULL,
    [isActive]             INT           NOT NULL,
    [isExcluded]           BIT           NULL
);

