CREATE TABLE [dbo].[SystemsIPAddresses] (
    [id]        INT           IDENTITY (1, 1) NOT NULL,
    [systemsID] INT           NOT NULL,
    [IPAddress] NVARCHAR (50) NOT NULL
);

