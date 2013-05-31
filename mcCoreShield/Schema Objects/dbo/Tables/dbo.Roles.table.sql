CREATE TABLE [dbo].[Roles] (
    [id]                UNIQUEIDENTIFIER NOT NULL,
    [RoleTitle]         NVARCHAR (50)    NOT NULL,
    [isActive]          BIT              NULL,
    [parentRolesID]     UNIQUEIDENTIFIER NULL,
    [statepage_include] BIT              NULL
);

