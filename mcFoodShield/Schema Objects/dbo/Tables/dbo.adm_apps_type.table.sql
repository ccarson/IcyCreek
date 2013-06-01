CREATE TABLE [dbo].[adm_apps_type] (
    [id]       INT           IDENTITY (6, 1) NOT NULL,
    [typename] NVARCHAR (25) NOT NULL,
    [active]   BIT           NOT NULL
);

