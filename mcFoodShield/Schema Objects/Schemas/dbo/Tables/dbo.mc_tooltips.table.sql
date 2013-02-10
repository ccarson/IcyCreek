CREATE TABLE [dbo].[mc_tooltips] (
    [id]      INT           IDENTITY (1, 1) NOT NULL,
    [tiptext] NVARCHAR (50) NOT NULL,
    [typeid]  INT           NOT NULL,
    [purpose] NVARCHAR (50) NULL
);

