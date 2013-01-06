CREATE TABLE [dbo].[pt_files] (
    [fileID]         NCHAR (35)     NOT NULL,
    [projectID]      NCHAR (35)     NOT NULL,
    [title]          NVARCHAR (200) NULL,
    [description]    NVARCHAR (MAX) NULL,
    [categoryID]     NCHAR (35)     NOT NULL,
    [filename]       NVARCHAR (150) NULL,
    [serverfilename] NVARCHAR (150) NULL,
    [filetype]       NVARCHAR (4)   NULL,
    [filesize]       INT            NULL,
    [uploaded]       DATETIME2 (0)  NULL,
    [uploadedBy]     NCHAR (35)     NOT NULL
);

