CREATE TABLE [dbo].[mc_contact_notifies] (
    [id]           INT            IDENTITY (87, 1) NOT NULL,
    [user_id]      INT            NOT NULL,
    [file_id]      INT            NOT NULL,
    [datecreated]  DATETIME2 (0)  NOT NULL,
    [active]       BIT            NOT NULL,
    [notes]        NVARCHAR (MAX) NULL,
    [component_id] INT            NOT NULL
);

