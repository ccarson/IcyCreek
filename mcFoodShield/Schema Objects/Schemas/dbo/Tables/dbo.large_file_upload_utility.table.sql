CREATE TABLE [dbo].[large_file_upload_utility] (
    [id]                   INT             IDENTITY (8, 1) NOT NULL,
    [filename]             NVARCHAR (255)  NOT NULL,
    [uniqueFileId]         NVARCHAR (255)  NOT NULL,
    [uploadedByUserId]     NVARCHAR (255)  NOT NULL,
    [mimeType]             NVARCHAR (255)  NOT NULL,
    [uploadedDate]         DATE            NOT NULL,
    [fileExpiresDate]      DATE            NOT NULL,
    [passwordProtect]      BIT             NULL,
    [password]             NVARCHAR (255)  NOT NULL,
    [notifyOnFileDownload] BIT             NULL,
    [filesize]             NUMERIC (20, 2) NOT NULL,
    [requirelogin]         BIT             NOT NULL,
    [group_id]             INT             NOT NULL,
    [active]               BIT             NOT NULL,
    [filePath]             NVARCHAR (255)  NULL
);

