CREATE TABLE Reference.EmailTypes (
    id            INT           NOT NULL    CONSTRAINT PK_EmailTypes PRIMARY KEY CLUSTERED  IDENTITY (1, 1)
  , EmailTypeID   INT           NOT NULL
  , portalName    NVARCHAR (20) NOT NULL
  , EmailTypeName NVARCHAR (50) NOT NULL
  , isActive      INT           NOT NULL
  , displayOrder  INT           NOT NULL
  , isExcluded    BIT           NULL
) ;
