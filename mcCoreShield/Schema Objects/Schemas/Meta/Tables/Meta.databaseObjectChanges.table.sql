CREATE TABLE [Meta].[databaseObjectChanges] (
    [id]           INT            IDENTITY (1, 1) NOT NULL,
    [EventDate]    DATETIME2 (7)  NOT NULL,
    [EventType]    NVARCHAR (64)  NULL,
    [EventDDL]     NVARCHAR (MAX) NULL,
    [EventXML]     XML            NULL,
    [DatabaseName] NVARCHAR (255) NULL,
    [SchemaName]   NVARCHAR (255) NULL,
    [ObjectName]   NVARCHAR (255) NULL,
    [HostName]     VARCHAR (64)   NULL,
    [IPAddress]    VARCHAR (32)   NULL,
    [ProgramName]  NVARCHAR (255) NULL,
    [LoginName]    NVARCHAR (255) NULL
);

