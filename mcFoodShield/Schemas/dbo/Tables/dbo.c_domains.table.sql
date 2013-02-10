CREATE TABLE [dbo].[c_domains] (
    [id]              INT            IDENTITY (1, 1) NOT NULL,
    [URL]             NVARCHAR (500) NOT NULL,
    [skinstart]       NVARCHAR (500) NOT NULL,
    [URLLogo]         NVARCHAR (500) NOT NULL,
    [createdBy]       INT            NOT NULL,
    [name]            NVARCHAR (100) NOT NULL,
    [background]      NVARCHAR (10)  NULL,
    [backgroundimage] NVARCHAR (255) NULL,
    [bactive]         BIT            NOT NULL,
    [linkcolor]       NVARCHAR (10)  NULL,
    [linkactive]      NVARCHAR (10)  NULL,
    [linkhover]       NVARCHAR (10)  NULL,
    [color]           NVARCHAR (10)  NULL
);

