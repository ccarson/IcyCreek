CREATE TABLE [dbo].[c_country] (
    [CountryID]           INT            IDENTITY (276, 1) NOT NULL,
    [Country]             NVARCHAR (255) NULL,
    [FIPS104]             NVARCHAR (255) NULL,
    [ISO2]                NVARCHAR (255) NULL,
    [ISO3]                NVARCHAR (255) NULL,
    [ISON]                NVARCHAR (255) NULL,
    [Internet]            NVARCHAR (255) NULL,
    [Capital]             NVARCHAR (255) NULL,
    [MapReference]        NVARCHAR (255) NULL,
    [NationalitySingular] NVARCHAR (255) NULL,
    [NationalityPlural]   NVARCHAR (255) NULL,
    [Currency]            NVARCHAR (255) NULL,
    [CurrencyCode]        NVARCHAR (255) NULL,
    [Population]          NVARCHAR (11)  NULL,
    [Title]               NVARCHAR (255) NULL,
    [Comment]             NVARCHAR (255) NULL,
    [InsertFunction]      NVARCHAR (250) NULL,
    [SelectFunction]      NVARCHAR (250) NULL
);

