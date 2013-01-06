CREATE TABLE [dbo].[security_roles] (
    [id]        INT           IDENTITY (11, 1) NOT NULL,
    [group_id]  INT           NOT NULL,
    [role_name] NVARCHAR (50) NULL,
    [active]    BIT           NOT NULL,
    [level_id]  INT           NOT NULL
);

