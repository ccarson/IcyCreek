CREATE TABLE [dbo].[calendarEventCategories] (
    [id]           INT            IDENTITY (1, 1) NOT NULL,
    [label]        NVARCHAR (400) NOT NULL,
    [editURL]      NVARCHAR (250) NULL,
    [TitleBKColor] NVARCHAR (10)  NULL,
    [BkColor]      NVARCHAR (10)  NULL
);

