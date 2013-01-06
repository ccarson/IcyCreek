CREATE TABLE [dbo].[plfClients] (
    [clientId]          INT            IDENTITY (1, 1) NOT NULL,
    [clientName]        NVARCHAR (150) NULL,
    [clientUID]         NVARCHAR (255) NULL,
    [clientDateCreated] DATETIME       NULL
);

