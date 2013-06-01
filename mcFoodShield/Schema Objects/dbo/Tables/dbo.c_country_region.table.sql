CREATE TABLE [dbo].[c_country_region] (
    [RegionID]  INT            IDENTITY (3954, 1) NOT NULL,
    [CountryID] INT            NULL,
    [Region]    NVARCHAR (255) NULL,
    [Code]      NVARCHAR (255) NULL,
    [ADM1Code]  NVARCHAR (255) NULL
);

