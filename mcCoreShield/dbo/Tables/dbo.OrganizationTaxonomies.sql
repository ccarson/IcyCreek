CREATE TABLE [dbo].[OrganizationTaxonomies] (
    [id]             UNIQUEIDENTIFIER CONSTRAINT [DF_OrganizationTaxonomies_id] DEFAULT (newsequentialid()) NOT NULL,
    [OrganizationID] UNIQUEIDENTIFIER NOT NULL,
    [TaxonomyID]     INT              NOT NULL,
    [IsActive]       BIT              CONSTRAINT [DF_OrganizationTaxonomies_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedBy]      UNIQUEIDENTIFIER NOT NULL,
    [UpdatedBy]      UNIQUEIDENTIFIER NULL,
    [CreatedOn]      DATETIME2 (7)    NOT NULL,
    [UpdatedOn]      DATETIME2 (7)    NULL,
    CONSTRAINT [PK_OrganizationTaxonomies] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_OrganizationTaxonomies_Organizations] FOREIGN KEY ([OrganizationID]) REFERENCES [dbo].[Organizations] ([id])
);

