CREATE TABLE [dbo].[s_templates] (
    [header]   NVARCHAR (MAX) NOT NULL,
    [id]       NVARCHAR (35)  NOT NULL,
    [footer]   NVARCHAR (MAX) NOT NULL,
    [useridfk] NVARCHAR (35)  NOT NULL,
    [name]     NVARCHAR (255) NOT NULL
);

