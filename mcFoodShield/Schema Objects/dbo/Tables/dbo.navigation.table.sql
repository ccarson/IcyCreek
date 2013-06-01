CREATE TABLE [dbo].[navigation] (
    [id]            INT            IDENTITY (1, 1) NOT NULL,
    [smenu_name]    NVARCHAR (50)  NOT NULL,
    [sdisplay_name] NVARCHAR (50)  NOT NULL,
    [surl]          NVARCHAR (150) NOT NULL,
    [bactive]       BIT            NOT NULL,
    [dtcreated]     DATETIME2 (0)  NOT NULL,
    [icreatedby]    INT            NOT NULL,
    [iparent_navid] INT            NOT NULL,
    [isort_order]   INT            NOT NULL,
    [icon]          NVARCHAR (50)  NULL
);

