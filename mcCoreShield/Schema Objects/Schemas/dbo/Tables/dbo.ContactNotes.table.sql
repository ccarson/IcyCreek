CREATE TABLE [dbo].[ContactNotes] (
    [id]         UNIQUEIDENTIFIER NOT NULL,
    [contactsID] UNIQUEIDENTIFIER NOT NULL,
    [notes]      NVARCHAR (500)   NULL,
    [adminID]    UNIQUEIDENTIFIER NULL,
    [dateAdded]  DATETIME2 (0)    NULL,
    [type_id]    INT              NULL
);

