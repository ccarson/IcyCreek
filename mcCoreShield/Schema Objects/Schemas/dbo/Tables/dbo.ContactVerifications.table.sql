CREATE TABLE [dbo].[ContactVerifications] (
    [id]            UNIQUEIDENTIFIER NOT NULL,
    [contactsID]    UNIQUEIDENTIFIER NOT NULL,
    [verified_by]   UNIQUEIDENTIFIER NULL,
    [verified_date] DATETIME2 (0)    NULL
);

