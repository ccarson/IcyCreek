CREATE TABLE [Reference].[Systems] (
    [id]             INT           NOT NULL,
    [systemName]     NVARCHAR (12) NOT NULL,
    [userSystemName] NVARCHAR (12) NULL,
    CONSTRAINT [PK_Systems] PRIMARY KEY CLUSTERED ([id] ASC)
);

