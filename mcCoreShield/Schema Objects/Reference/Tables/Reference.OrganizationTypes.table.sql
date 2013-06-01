CREATE TABLE Reference.OrganizationTypes (
    id                   INT           NOT NULL CONSTRAINT PK_OrganizationTypes PRIMARY KEY CLUSTERED   IDENTITY
  , OrganizationTypeID   INT           NOT NULL
  , portalName           NVARCHAR (20) NOT NULL
  , OrganizationTypeName NVARCHAR (50) NOT NULL
  , isActive             INT           NOT NULL
  , isExcluded           BIT           NULL
) ;
