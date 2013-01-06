CREATE TABLE [dbo].[meetingsRoles] (
    [id]        INT           IDENTITY (1, 1) NOT NULL,
    [sRoleName] NVARCHAR (50) NOT NULL,
    [bActive]   BIT           DEFAULT ((1)) NOT NULL
);

