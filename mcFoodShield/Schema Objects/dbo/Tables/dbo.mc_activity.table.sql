CREATE TABLE [dbo].[mc_activity] (
    [ID]          INT            IDENTITY (9, 1) NOT NULL,
    [Name]        NVARCHAR (50)  NOT NULL,
    [Description] NVARCHAR (MAX) NULL,
    [active]      BIT            NOT NULL,
    [typeid]      INT            NOT NULL,
    [editable]    BIT            NOT NULL
);

