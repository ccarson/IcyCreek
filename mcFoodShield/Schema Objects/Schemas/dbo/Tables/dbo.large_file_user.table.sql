CREATE TABLE [dbo].[large_file_user] (
    [id]              INT            IDENTITY (1, 1) NOT NULL,
    [emailAddr]       NVARCHAR (255) NOT NULL,
    [viewedPage]      BIT            NULL,
    [viewedPageDate]  DATETIME2 (7)  NOT NULL,
    [clickedDownload] BIT            NULL,
    [uniqueFileId]    NVARCHAR (15)  NOT NULL
);

