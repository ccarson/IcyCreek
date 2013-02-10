CREATE TABLE [dbo].[mc_terms] (
    [id]        INT           IDENTITY (7, 1) NOT NULL,
    [termname]  NVARCHAR (25) NOT NULL,
    [yearvalue] INT           NOT NULL,
    [active]    BIT           NOT NULL,
    [startdate] DATETIME2 (0) NULL,
    [enddate]   DATETIME2 (0) NULL
);

