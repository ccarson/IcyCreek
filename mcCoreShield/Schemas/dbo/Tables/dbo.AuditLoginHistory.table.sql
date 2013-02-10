CREATE TABLE [dbo].[AuditLoginHistory] (
    [id]         INT           IDENTITY (23377, 1) NOT NULL,
    [user_id]    INT           DEFAULT ('0') NOT NULL,
    [login_date] DATETIME2 (0) DEFAULT (NULL) NULL,
    [systemID]   INT           DEFAULT ((0)) NOT NULL,
    [appID]      INT           DEFAULT ((0)) NOT NULL
);

