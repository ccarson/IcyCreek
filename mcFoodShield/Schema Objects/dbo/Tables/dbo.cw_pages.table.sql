CREATE TABLE [dbo].[cw_pages] (
    [id]              VARCHAR (35)  NOT NULL,
    [path]            VARCHAR (255) NOT NULL,
    [body]            VARCHAR (MAX) NOT NULL,
    [datetimecreated] DATETIME2 (0) NULL,
    [author]          VARCHAR (255) NULL,
    [version]         INT           NOT NULL,
    [summary]         VARCHAR (255) NULL,
    [categories]      VARCHAR (255) NULL,
    [authrolestoview] VARCHAR (255) NULL,
    [authrolestoedit] VARCHAR (255) NULL,
    [filename]        VARCHAR (255) NULL,
    [filesize]        VARCHAR (255) NULL,
    [filemimetype]    VARCHAR (45)  NULL,
    [imagewidth]      BIGINT        NULL,
    [imageheight]     BIGINT        NULL,
    [wiki]            VARCHAR (255) NOT NULL
);

