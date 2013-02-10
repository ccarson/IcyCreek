CREATE TABLE [dbo].[ContactPhones] (
    [id]           UNIQUEIDENTIFIER NOT NULL,
    [contactsID]   UNIQUEIDENTIFIER NOT NULL,
    [phone]        NVARCHAR (100)   NULL,
    [type_id]      INT              NULL,
    [edefault]     BIT              NULL,
    [active]       BIT              NULL,
    [epublic]      BIT              NULL,
    [extension]    NVARCHAR (10)    NULL,
    [alert]        BIT              NULL,
    [is_emergency] BIT              NULL
);

