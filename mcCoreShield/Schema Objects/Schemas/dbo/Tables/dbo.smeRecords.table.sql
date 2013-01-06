CREATE TABLE [dbo].[smeRecords] (
    [id]        INT              IDENTITY (1, 1) NOT NULL,
    [name]      NVARCHAR (200)   NOT NULL,
    [createdBy] UNIQUEIDENTIFIER NULL,
    [dtCreated] DATETIME         NULL,
    [updatedBy] UNIQUEIDENTIFIER NULL,
    [dtUpdated] DATETIME         NULL,
    [bActive]   BIT              DEFAULT ((1)) NOT NULL
);

