CREATE TABLE [dbo].[c_groupcores] (
    [id]       INT           IDENTITY (5, 1) NOT NULL,
    [corename] NVARCHAR (50) NOT NULL,
    [color]    NVARCHAR (15) NULL,
    [admin]    BIT           NOT NULL,
    [use_date] BIT           NOT NULL
);

