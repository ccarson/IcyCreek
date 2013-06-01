CREATE TABLE [dbo].[OrganizationTaxonomyResponsibilities] (
    [id]                     UNIQUEIDENTIFIER CONSTRAINT [DF_OrganizationTaxonomyResponsibilities_id] DEFAULT (newsequentialid()) NOT NULL,
    [OrganizationTaxonomyID] UNIQUEIDENTIFIER NOT NULL,
    [OrgDepartmentID]        UNIQUEIDENTIFIER NULL,
    [OrgLocationID]          UNIQUEIDENTIFIER NULL,
    [RolesID]                UNIQUEIDENTIFIER NULL,
    [IsActive]               BIT              CONSTRAINT [DF_OrganizationTaxonomyResponsibilities_IsActive] DEFAULT ((1)) NOT NULL,
    [ResponsibilityType]     NCHAR (1)        CONSTRAINT [DF_OrganizationTaxonomyResponsibilities_RespType] DEFAULT (N'C') NOT NULL,
    [CreatedOn]              DATETIME2 (7)    NOT NULL,
    [UpdatedOn]              DATETIME2 (7)    NULL,
    [CreatedBy]              UNIQUEIDENTIFIER NOT NULL,
    [UpdatedBy]              UNIQUEIDENTIFIER NULL,
    CONSTRAINT [PK_OrganizationTaxonomyResponsibilities] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [CK_OrganizationTaxonomyResponsibilities_RespType] CHECK ([ResponsibilityType]=N'P' OR [ResponsibilityType]=N'O' OR [ResponsibilityType]=N'C'),
    CONSTRAINT [FK_OrganizationTaxonomyResponsibilities_OrganizationTaxonomies] FOREIGN KEY ([OrganizationTaxonomyID]) REFERENCES [dbo].[OrganizationTaxonomies] ([id]),
    CONSTRAINT [FK_OrganizationTaxonomyResponsibilities_OrgDepartments] FOREIGN KEY ([OrgDepartmentID]) REFERENCES [dbo].[OrgDepartments] ([id]),
    CONSTRAINT [FK_OrganizationTaxonomyResponsibilities_OrgLocations] FOREIGN KEY ([OrgLocationID]) REFERENCES [dbo].[OrgLocations] ([id]),
    CONSTRAINT [FK_OrganizationTaxonomyResponsibilities_Roles] FOREIGN KEY ([RolesID]) REFERENCES [dbo].[Roles] ([id])
);

