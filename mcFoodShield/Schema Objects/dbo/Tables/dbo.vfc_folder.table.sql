CREATE TABLE [dbo].[vfc_folder] (
    [ID]               INT              IDENTITY (6172, 1) NOT NULL,
    [ParentFolderID]   INT              CONSTRAINT [DF_vfc_folder_ParentFolderID] DEFAULT ('0') NULL,
    [sName]            NVARCHAR (500)   NOT NULL,
    [sLocation]        NVARCHAR (MAX)   NULL,
    [dtCreated]        DATETIME2 (0)    NOT NULL,
    [CreatedByUserID]  INT              CONSTRAINT [DF_vfc_folder_CreatedByUserID] DEFAULT ('0') NOT NULL,
    [sComments]        NVARCHAR (MAX)   NULL,
    [sDescription]     NVARCHAR (MAX)   NULL,
    [bactive]          BIT              CONSTRAINT [DF_vfc_folder_bactive] DEFAULT ((1)) NOT NULL,
    [group_id]         INT              CONSTRAINT [DF_vfc_folder_group_id] DEFAULT ('0') NOT NULL,
    [makepublic]       BIT              CONSTRAINT [DF_vfc_folder_makepublic] DEFAULT ((0)) NOT NULL,
    [forum_id]         NVARCHAR (50)    CONSTRAINT [DF_vfc_folder_forum_id] DEFAULT (NULL) NULL,
    [system]           BIT              CONSTRAINT [DF_vfc_folder_system] DEFAULT ((0)) NULL,
    [user_id]          INT              CONSTRAINT [DF_vfc_folder_user_id] DEFAULT ('0') NOT NULL,
    [FolderType]       INT              CONSTRAINT [DF_vfc_folder_FolderType] DEFAULT ('3') NOT NULL,
    [isystem_id]       INT              CONSTRAINT [DF_vfc_folder_isystem_id] DEFAULT ('0') NOT NULL,
    [dtUpdated]        DATETIME2 (0)    CONSTRAINT [DF_vfc_folder_dtUpdated] DEFAULT (NULL) NULL,
    [updatedByUserID]  INT              CONSTRAINT [DF_vfc_folder_updatedByUserID] DEFAULT ('0') NOT NULL,
    [folderUUID]       UNIQUEIDENTIFIER CONSTRAINT [DF_vfc_folder_folderUUID] DEFAULT (newsequentialid()) NOT NULL,
    [sLocationOrg]     NVARCHAR (MAX)   NULL,
    [sLocationUpdated] BIT              CONSTRAINT [DF_vfc_folder_sLocationUpdated] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_vfc_folder_ID] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [vfc_folder$vfcfoldid] UNIQUE NONCLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90)
);




GO
CREATE NONCLUSTERED INDEX [IX_vfc_folder_sName]
    ON [dbo].[vfc_folder]([sName] ASC, [user_id] ASC)
    INCLUDE([ID]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_vfc_folder_ParentFolder]
    ON [dbo].[vfc_folder]([ParentFolderID] ASC, [FolderType] ASC)
    INCLUDE([bactive]) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_vfc_folder_group]
    ON [dbo].[vfc_folder]([group_id] ASC)
    INCLUDE([ID]);

