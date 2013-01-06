CREATE TABLE [dbo].[pt_clients] (
    [clientID]     NCHAR (35)     NOT NULL,
    [name]         NVARCHAR (150) NULL,
    [address]      NVARCHAR (MAX) NULL,
    [city]         NVARCHAR (150) NULL,
    [locality]     NVARCHAR (200) NULL,
    [country]      NVARCHAR (35)  NULL,
    [postal]       NVARCHAR (40)  NULL,
    [phone]        NVARCHAR (40)  NULL,
    [fax]          NVARCHAR (40)  NULL,
    [contactName]  NVARCHAR (60)  NULL,
    [contactPhone] NVARCHAR (40)  NULL,
    [contactEmail] NVARCHAR (150) NULL,
    [website]      NVARCHAR (150) NULL,
    [notes]        NVARCHAR (MAX) NULL,
    [active]       BIT            NULL
);

