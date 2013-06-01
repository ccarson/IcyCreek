CREATE TABLE Meta.databaseObjectChanges (
    id              INT             NOT NULL    CONSTRAINT PK_databaseObjectChanges PRIMARY KEY CLUSTERED   IDENTITY 
  , EventDate       DATETIME2 (7)   NOT NULL    CONSTRAINT DF_databaseObjectChanges_EventDate DEFAULT SYSDATETIME()
  , EventType       NVARCHAR (64)   NULL
  , EventDDL        NVARCHAR (MAX)  NULL
  , EventXML        XML             NULL
  , DatabaseName    NVARCHAR (255)  NULL
  , SchemaName      NVARCHAR (255)  NULL
  , ObjectName      NVARCHAR (255)  NULL
  , HostName        VARCHAR (64)    NULL
  , IPAddress       VARCHAR (32)    NULL
  , ProgramName     NVARCHAR (255)  NULL
  , LoginName       NVARCHAR (255)  NULL
) ;