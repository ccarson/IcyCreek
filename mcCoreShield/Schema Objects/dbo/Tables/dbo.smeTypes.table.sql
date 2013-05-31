CREATE TABLE [dbo].[smeTypes] (
    [id]        INT              IDENTITY (1, 1) NOT NULL,
    [typename]  NVARCHAR (255)   NOT NULL,
    [bActive]   BIT              DEFAULT ((1)) NOT NULL,
    [createdBy] UNIQUEIDENTIFIER NULL,
    [dtCreated] DATETIME         NULL,
    [updatedBy] UNIQUEIDENTIFIER NULL,
    [dtUpdated] DATETIME         NULL
);

