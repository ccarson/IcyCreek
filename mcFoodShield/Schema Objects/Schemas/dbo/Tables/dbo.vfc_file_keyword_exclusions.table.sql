CREATE TABLE [dbo].[vfc_file_keyword_exclusions] (
    [id]               UNIQUEIDENTIFIER NOT NULL,
    [keyword]          NVARCHAR (100)   NOT NULL,
    [isAlwaysExcluded] BIT              NOT NULL
);

