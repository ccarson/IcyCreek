CREATE TABLE [dbo].[ContactAddresses] (
    [id]             UNIQUEIDENTIFIER NOT NULL,
    [contactsID]     UNIQUEIDENTIFIER NOT NULL,
    [add_type]       INT              NULL,
    [address1]       NVARCHAR (200)   NULL,
    [address2]       NVARCHAR (200)   NULL,
    [address3]       NVARCHAR (200)   NULL,
    [city]           NVARCHAR (150)   NULL,
    [state]          NVARCHAR (50)    NULL,
    [zip]            NVARCHAR (20)    NULL,
    [country]        NVARCHAR (20)    NULL,
    [defaultaddress] BIT              NULL,
    [name]           NVARCHAR (100)   NULL,
    [createdDate]    DATETIME2 (0)    NULL
);

