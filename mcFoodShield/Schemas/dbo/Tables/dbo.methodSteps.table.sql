CREATE TABLE [dbo].[methodSteps] (
    [id]               INT            IDENTITY (1, 1) NOT NULL,
    [methodsID]        INT            NOT NULL,
    [stepOrder]        INT            NOT NULL,
    [name]             NVARCHAR (100) NOT NULL,
    [isActive]         BIT            NOT NULL,
    [information]      NVARCHAR (MAX) NULL,
    [nodeType]         NVARCHAR (20)  NULL,
    [incPluginComment] BIT            NOT NULL
);

