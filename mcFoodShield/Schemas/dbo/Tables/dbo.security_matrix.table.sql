CREATE TABLE [dbo].[security_matrix] (
    [id]        INT IDENTITY (21019, 1) NOT NULL,
    [user_id]   INT NOT NULL,
    [func_id]   INT NOT NULL,
    [asset_id]  INT NOT NULL,
    [sys_admin] BIT NOT NULL,
    [role_id]   INT NOT NULL
);

