CREATE TABLE [dbo].[ContactEmails] (
    [id]           UNIQUEIDENTIFIER NOT NULL,
    [contactsID]   UNIQUEIDENTIFIER NOT NULL,
    [email]        NVARCHAR (60)    NULL,
    [type_id]      INT              NULL,
    [edefault]     BIT              NULL,
    [active]       BIT              NULL,
    [epublic]      BIT              NULL,
    [alert]        BIT              NULL,
    [is_emergency] BIT              NULL
);

