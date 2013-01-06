CREATE TABLE [dbo].[preso_groups] (
    [id]                INT            NULL,
    [name]              NVARCHAR (200) NULL,
    [description]       NVARCHAR (200) NULL,
    [autoAcceptMembers] BIT            NULL,
    [alias]             NVARCHAR (200) NULL,
    [updatedOn]         DATETIME2 (7)  NULL,
    [pathToImageThumb]  NVARCHAR (200) NULL,
    [pathToImage]       NVARCHAR (200) NULL,
    [createdOn]         DATETIME2 (7)  NULL
);

