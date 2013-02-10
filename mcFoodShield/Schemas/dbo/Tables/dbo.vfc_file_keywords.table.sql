CREATE TABLE [dbo].[vfc_file_keywords] (
    [id]             UNIQUEIDENTIFIER NOT NULL,
    [fileID]         UNIQUEIDENTIFIER NOT NULL,
    [keyword]        NVARCHAR (100)   NOT NULL,
    [wordCount]      INT              NOT NULL,
    [includeKeyword] BIT              NOT NULL,
    [excludeKeyword] BIT              NOT NULL,
    [dateAdded]      DATETIME2 (7)    NOT NULL
);

