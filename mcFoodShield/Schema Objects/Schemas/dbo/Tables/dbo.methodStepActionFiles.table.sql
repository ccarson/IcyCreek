CREATE TABLE [dbo].[methodStepActionFiles] (
    [id]                  INT            IDENTITY (1, 1) NOT NULL,
    [methodStepActionsID] INT            NOT NULL,
    [vfc_fileID]          INT            NULL,
    [fileName]            NVARCHAR (100) NULL
);

