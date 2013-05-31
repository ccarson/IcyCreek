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
    [requirelogin]         BIT             CONSTRAINT [DF_large_file_upload_utility_requirelogin] DEFAULT ((0)) NOT NULL,
    [group_id]             INT             CONSTRAINT [DF_large_file_upload_utility_group_id] DEFAULT ('0') NOT NULL,
    [active]               BIT             CONSTRAINT [DF_large_file_upload_utility_active] DEFAULT ('1') NOT NULL,
    [filePath]             NVARCHAR (255)  NULL,
    [uploaded]             BIT             CONSTRAINT [DF_large_file_upload_utility_uploaded] DEFAULT ((0)) NOT NULL,
    [OrgFilePath]          NVARCHAR (255)  NULL,
    CONSTRAINT [PK_large_file_upload_utility_id] PRIMARY KEY CLUSTERED ([id] ASC, [uniqueFileId] ASC)
);



