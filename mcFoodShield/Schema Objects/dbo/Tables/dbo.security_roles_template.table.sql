CREATE TABLE [dbo].[security_roles_template] (
    [id]          INT           IDENTITY (199, 1) NOT NULL,
    [role_id]     INT           NOT NULL,
    [asset_id]    INT           NOT NULL,
    [func_id]     INT           NOT NULL,
    [active]      BIT           NOT NULL,
    [dateCreated] DATETIME2 (0) NOT NULL,
    [dateEdited]  DATETIME2 (0) NOT NULL,
    [admin]       INT           NOT NULL
);

