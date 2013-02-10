CREATE TABLE [dbo].[large_file_email] (
    [id]             INT           IDENTITY (36, 1) NOT NULL,
    [emailAddress]   NVARCHAR (55) NOT NULL,
    [uniqueFileId]   NVARCHAR (50) NOT NULL,
    [dateSent]       DATETIME2 (7) NOT NULL,
    [viewedPageDate] DATETIME2 (7) NULL,
    [viewedPage]     BIT           NOT NULL,
    [downloaded]     BIT           NOT NULL,
    [user_id]        INT           NULL
);

