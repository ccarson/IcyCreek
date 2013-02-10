CREATE TABLE [dbo].[vfc_folder] (
    [ID]              INT              IDENTITY (6172, 1) NOT NULL,
    [ParentFolderID]  INT              NULL,
    [sName]           NVARCHAR (500)   NOT NULL,
    [sLocation]       NVARCHAR (MAX)   NULL,
    [dtCreated]       DATETIME2 (0)    NOT NULL,
    [CreatedByUserID] INT              NOT NULL,
    [sComments]       NVARCHAR (MAX)   NULL,
    [sDescription]    NVARCHAR (MAX)   NULL,
    [bactive]         BIT              NOT NULL,
    [group_id]        INT              NOT NULL,
    [makepublic]      BIT              NOT NULL,
    [forum_id]        NVARCHAR (50)    NULL,
    [system]          BIT              NULL,
    [user_id]         INT              NOT NULL,
    [FolderType]      INT              NOT NULL,
    [isystem_id]      INT              NOT NULL,
    [dtUpdated]       DATETIME2 (0)    NULL,
    [updatedByUserID] INT              NOT NULL,
    [folderUUID]      UNIQUEIDENTIFIER NOT NULL
);

