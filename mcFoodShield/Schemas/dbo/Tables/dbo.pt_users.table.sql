CREATE TABLE [dbo].[pt_users] (
    [userID]    NCHAR (35)     NOT NULL,
    [firstName] NVARCHAR (12)  NULL,
    [lastName]  NVARCHAR (20)  NULL,
    [username]  NVARCHAR (50)  NULL,
    [password]  NCHAR (32)     NULL,
    [email]     NVARCHAR (120) NULL,
    [phone]     NVARCHAR (15)  NULL,
    [mobile]    NVARCHAR (15)  NULL,
    [carrierID] NVARCHAR (35)  NULL,
    [lastLogin] DATETIME2 (0)  NULL,
    [avatar]    BIT            NULL,
    [style]     NVARCHAR (20)  NULL,
    [locale]    NVARCHAR (32)  NULL,
    [timezone]  NVARCHAR (32)  NULL,
    [admin]     BIT            NULL,
    [report]    BIT            NULL,
    [invoice]   BIT            NULL,
    [active]    BIT            NULL
);

