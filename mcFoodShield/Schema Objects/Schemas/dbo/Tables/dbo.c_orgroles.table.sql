CREATE TABLE [dbo].[c_orgroles] (
    [id]       INT           IDENTITY (18, 1) NOT NULL,
    [newID]    INT           NULL,
    [roleName] NVARCHAR (50) NOT NULL,
    [active]   BIT           NOT NULL
);

