CREATE TABLE [dbo].[smeUsers] (
    [id]         INT              IDENTITY (1, 1) NOT NULL,
    [userID]     UNIQUEIDENTIFIER NULL,
    [recordID]   INT              DEFAULT ((0)) NOT NULL,
    [levelID]    INT              NULL,
    [bActive]    BIT              DEFAULT ((1)) NOT NULL,
    [createdBy]  UNIQUEIDENTIFIER NULL,
    [dtCreated]  DATETIME         NULL,
    [updatedBy]  UNIQUEIDENTIFIER NULL,
    [dtUpdated]  DATETIME         NULL,
    [categoryID] INT              DEFAULT ((0)) NOT NULL
);

