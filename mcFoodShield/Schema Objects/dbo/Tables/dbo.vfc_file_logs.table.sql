CREATE TABLE [dbo].[vfc_file_logs] (
    [id]             INT           IDENTITY (774, 1) NOT NULL,
    [doc_id]         INT           NOT NULL,
    [iAction]        INT           NOT NULL,
    [user_id]        INT           NOT NULL,
    [dAction]        DATETIME2 (0) NOT NULL,
    [iMajorrevision] INT           NOT NULL,
    [iMinorrevision] INT           NOT NULL,
    [iVersionDocID]  INT           NOT NULL
);

