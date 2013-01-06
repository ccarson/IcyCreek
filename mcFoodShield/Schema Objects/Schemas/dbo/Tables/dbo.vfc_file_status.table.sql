CREATE TABLE [dbo].[vfc_file_status] (
    [id]         INT           IDENTITY (5, 1) NOT NULL,
    [statusname] NVARCHAR (25) NOT NULL,
    [active]     BIT           NOT NULL
);

