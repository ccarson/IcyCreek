CREATE TABLE [dbo].[mc_grouptypes_roles] (
    [id]           INT IDENTITY (77, 1) NOT NULL,
    [grouptype_id] INT NOT NULL,
    [role_id]      INT NOT NULL,
    [admin]        BIT NOT NULL,
    [active]       BIT NOT NULL
);

