CREATE TABLE [dbo].[vfc_file_dynamic] (
    [id]          INT            IDENTITY (6, 1) NOT NULL,
    [filecontent] NVARCHAR (MAX) NULL,
    [folder_id]   INT            NOT NULL,
    [group_id]    INT            NOT NULL,
    [file_id]     INT            NOT NULL
);

