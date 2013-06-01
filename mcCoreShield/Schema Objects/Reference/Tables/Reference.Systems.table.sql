CREATE TABLE Reference.Systems (
    id             INT           NOT NULL   CONSTRAINT PK_Systems PRIMARY KEY CLUSTERED
  , systemName     NVARCHAR (12) NOT NULL
  , userSystemName NVARCHAR (12) NULL
) ;
