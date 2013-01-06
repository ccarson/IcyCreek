CREATE TABLE [dbo].[vfc_file_dyn_edits] (
    [id]         INT           IDENTITY (1, 1) NOT NULL,
    [user_id]    INT           NOT NULL,
    [ModifiedOn] DATETIME2 (0) NOT NULL,
    [file_id]    INT           NOT NULL
);

