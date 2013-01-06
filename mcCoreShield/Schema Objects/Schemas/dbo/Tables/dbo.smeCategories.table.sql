CREATE TABLE [dbo].[smeCategories] (
    [id]        INT              IDENTITY (1, 1) NOT NULL,
    [name]      NVARCHAR (100)   NULL,
    [bActive]   BIT              DEFAULT ((1)) NOT NULL,
    [createdBy] UNIQUEIDENTIFIER NULL,
    [dtCreated] DATETIME         NULL,
    [updatedBy] UNIQUEIDENTIFIER NULL,
    [dtUpdated] DATETIME         NULL,
    [typeID]    INT              NULL
);

