CREATE TABLE [dbo].[vfc_file_tags] (
    [id]          INT           IDENTITY (61, 1) NOT NULL,
    [tag]         NVARCHAR (50) NOT NULL,
    [file_id]     INT           NOT NULL,
    [DateCreated] DATETIME2 (0) NOT NULL,
    [CreatedBy]   INT           NOT NULL
);

