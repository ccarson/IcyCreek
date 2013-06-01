CREATE TABLE [dbo].[mc_news] (
    [headline]  NVARCHAR (50)  NOT NULL,
    [news]      NVARCHAR (MAX) NULL,
    [created]   DATETIME2 (0)  NOT NULL,
    [expires]   DATETIME2 (0)  NULL,
    [newsorder] INT            NOT NULL,
    [excerpt]   NVARCHAR (100) NULL,
    [active]    BIT            NOT NULL,
    [id]        INT            IDENTITY (11, 1) NOT NULL
);

