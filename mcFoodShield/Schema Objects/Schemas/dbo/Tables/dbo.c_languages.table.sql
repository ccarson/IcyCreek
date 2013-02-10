CREATE TABLE [dbo].[c_languages] (
    [id]         INT            IDENTITY (3, 1) NOT NULL,
    [fieldname]  NVARCHAR (25)  NOT NULL,
    [fieldvalue] NVARCHAR (MAX) NOT NULL,
    [typeid]     INT            NOT NULL,
    [active]     BIT            NOT NULL
);

