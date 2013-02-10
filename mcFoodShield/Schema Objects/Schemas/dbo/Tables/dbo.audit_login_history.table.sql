CREATE TABLE [dbo].[audit_login_history] (
    [id]         INT           IDENTITY (23377, 1) NOT NULL,
    [user_id]    INT           NOT NULL,
    [login_date] DATETIME2 (0) NULL
);

