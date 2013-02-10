CREATE TABLE [dbo].[smeLevels] (
    [id]        INT              IDENTITY (1, 1) NOT NULL,
    [levelname] NVARCHAR (100)   NOT NULL,
    [bActive]   BIT              DEFAULT ((1)) NOT NULL,
    [createdBy] UNIQUEIDENTIFIER NULL,
    [dtCreated] DATETIME         NULL,
    [updatedBy] UNIQUEIDENTIFIER NULL,
    [dtUpdated] DATETIME         NULL
);

