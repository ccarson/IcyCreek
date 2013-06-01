CREATE TABLE [dbo].[pt_carriers] (
    [carrierID]   NCHAR (35)    NOT NULL,
    [carrier]     NVARCHAR (20) NULL,
    [countryCode] NVARCHAR (2)  NULL,
    [country]     NVARCHAR (20) NULL,
    [prefix]      NVARCHAR (3)  NULL,
    [suffix]      NVARCHAR (40) NULL,
    [active]      BIT           NULL
);

