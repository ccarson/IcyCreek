CREATE TABLE [dbo].[fs_allhazardtitles] (
    [id]             INT            IDENTITY (24, 1) NOT NULL,
    [newID]          INT            NULL,
    [hazardTitle]    NVARCHAR (50)  NOT NULL,
    [classification] INT            NOT NULL,
    [definition]     NVARCHAR (MAX) NULL,
    [active]         BIT            NOT NULL
);

