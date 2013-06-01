CREATE TABLE [dbo].[nodes] (
    [nodeId]       INT            IDENTITY (1, 1) NOT NULL,
    [nodeParentId] INT            NULL,
    [nodeName]     NVARCHAR (255) NULL,
    [nodeOrder]    INT            NULL
);

