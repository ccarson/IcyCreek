CREATE TABLE [dbo].[mc_contact_messages] (
    [id]        INT            IDENTITY (1, 1) NOT NULL,
    [user_id]   INT            NOT NULL,
    [admin_id]  INT            NOT NULL,
    [active]    BIT            NOT NULL,
    [CreatedOn] DATETIME2 (0)  NOT NULL,
    [read]      BIT            NOT NULL,
    [archive]   BIT            NOT NULL,
    [comments]  NVARCHAR (MAX) NULL,
    [subject]   NVARCHAR (50)  NULL
);

