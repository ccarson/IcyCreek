CREATE TABLE [dbo].[c_language_types] (
    [id]       INT           IDENTITY (1, 1) NOT NULL,
    [language] NVARCHAR (25) NOT NULL,
    [active]   BIT           NOT NULL,
    [default]  BIT           NOT NULL
);

