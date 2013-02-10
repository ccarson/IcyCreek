CREATE TABLE [dbo].[mc_addresstypes] (
    [id]       INT           IDENTITY (7, 1) NOT NULL,
    [typename] NVARCHAR (25) NOT NULL,
    [active]   BIT           NOT NULL
);

