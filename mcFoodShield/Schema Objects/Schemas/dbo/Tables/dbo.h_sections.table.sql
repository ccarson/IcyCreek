CREATE TABLE [dbo].[h_sections] (
    [id]         INT           IDENTITY (1, 1) NOT NULL,
    [iapp_id]    INT           NOT NULL,
    [shelpname]  NVARCHAR (75) NOT NULL,
    [icreatedby] INT           NOT NULL,
    [dtcreated]  DATETIME2 (0) NOT NULL,
    [bactive]    BIT           NOT NULL
);

