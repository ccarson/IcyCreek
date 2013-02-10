CREATE TABLE [dbo].[vfc_file_priority] (
    [id]            INT           IDENTITY (5, 1) NOT NULL,
    [sPriorityName] NVARCHAR (50) NOT NULL,
    [sLabelColor]   NVARCHAR (20) NOT NULL,
    [bactive]       BIT           NOT NULL
);

