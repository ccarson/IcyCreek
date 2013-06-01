CREATE TABLE [dbo].[vfc_folderhistory] (
    [ID]               INT            NOT NULL,
    [FolderID]         INT            NOT NULL,
    [sName]            NVARCHAR (MAX) NOT NULL,
    [dtUpdated]        DATETIME2 (0)  NOT NULL,
    [UpdatedByUserID]  INT            NOT NULL,
    [sHistoryComments] NVARCHAR (MAX) NULL,
    [sFolderComments]  NVARCHAR (MAX) NULL,
    [sDescription]     NVARCHAR (MAX) NULL
);

