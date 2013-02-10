CREATE TABLE [dbo].[OrgLocations] (
    [id]                 UNIQUEIDENTIFIER NOT NULL,
    [organizationsID]    UNIQUEIDENTIFIER NOT NULL,
    [addressTypeID]      INT              NULL,
    [name]               NVARCHAR (500)   NULL,
    [address1]           NVARCHAR (200)   NULL,
    [address2]           NVARCHAR (200)   NULL,
    [address3]           NVARCHAR (200)   NULL,
    [city]               NVARCHAR (50)    NULL,
    [state]              NVARCHAR (50)    NULL,
    [zip]                NVARCHAR (10)    NULL,
    [d_phone]            NVARCHAR (25)    NULL,
    [d_fax]              NVARCHAR (25)    NULL,
    [active]             BIT              NULL,
    [notes]              NVARCHAR (500)   NULL,
    [country]            NVARCHAR (20)    NULL,
    [d_emergency_phone]  NVARCHAR (25)    NULL,
    [d_24hr_phone]       NVARCHAR (25)    NULL,
    [date_added]         DATETIME2 (0)    NULL,
    [date_updated]       DATETIME2 (0)    NULL,
    [d_infectious_phone] NVARCHAR (25)    NULL,
    [isAlternate]        BIT              NULL
);

