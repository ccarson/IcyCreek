CREATE TABLE [dbo].[preso_slideshows] (
    [id]               INT            NULL,
    [pathToAttachment] NVARCHAR (200) NULL,
    [isConverting]     BIT            NULL,
    [updatedOn]        DATETIME2 (7)  NULL,
    [allowComments]    BIT            NULL,
    [abstract]         NVARCHAR (500) NULL,
    [createdOn]        DATETIME2 (7)  NULL,
    [lastBuildDate]    DATETIME2 (7)  NULL,
    [password]         NVARCHAR (500) NULL,
    [hasErrors]        BIT            NULL,
    [alias]            NVARCHAR (500) NULL,
    [slideshowRootDir] NVARCHAR (500) NULL,
    [pathToThumb]      NVARCHAR (500) NULL,
    [notifyComments]   BIT            NULL,
    [isPublishing]     BIT            NULL,
    [title]            NVARCHAR (500) NULL,
    [createdBy]        INT            NULL,
    [groupID]          INT            NULL
);

