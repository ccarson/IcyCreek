CREATE TABLE [dbo].[mc_contact_custom] (
    [id]            INT            IDENTITY (46, 1) NOT NULL,
    [fieldname]     NVARCHAR (50)  NOT NULL,
    [fieldtype]     NVARCHAR (25)  NOT NULL,
    [longname]      NVARCHAR (150) NULL,
    [adminonly]     BIT            NOT NULL,
    [readonly]      BIT            NOT NULL,
    [participatory] BIT            NOT NULL,
    [documents]     BIT            NOT NULL
);

