CREATE TABLE Reference.PhoneTypes (
    id            INT           NOT NULL    CONSTRAINT PK_PhoneTypes PRIMARY KEY CLUSTERED  IDENTITY
  , PhoneTypeID   INT           NOT NULL
  , portalName    NVARCHAR (20) NOT NULL
  , PhoneTypeName NVARCHAR (50) NOT NULL
  , isActive      INT           NOT NULL
  , displayOrder  INT           NOT NULL
  , isExcluded    BIT           NULL
) ;
