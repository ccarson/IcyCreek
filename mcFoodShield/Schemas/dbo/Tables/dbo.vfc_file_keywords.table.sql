CREATE TABLE [dbo].[vfc_file_keywords] (
    [id]             UNIQUEIDENTIFIER CONSTRAINT [DF_vfc_file_keywords_id] DEFAULT (newsequentialid()) NOT NULL,
    [fileID]         UNIQUEIDENTIFIER NOT NULL,
    [keyword]        NVARCHAR (100)   NOT NULL,
    [wordCount]      INT              NOT NULL,
    [includeKeyword] BIT              CONSTRAINT [DF_vfc_file_keywords_includeKeyword] DEFAULT ((1)) NOT NULL,
    [excludeKeyword] BIT              CONSTRAINT [DF_vfc_file_keywords_excludeKeyword] DEFAULT ((0)) NOT NULL,
    [dateAdded]      DATETIME2 (7)    CONSTRAINT [DF_vfc_file_keywords_dateAdded] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_vfc_file_keywords] PRIMARY KEY CLUSTERED ([id] ASC)
);




GO
CREATE NONCLUSTERED INDEX [IX_vfc_file_keywords]
    ON [dbo].[vfc_file_keywords]([keyword] ASC)
    INCLUDE([fileID]);

