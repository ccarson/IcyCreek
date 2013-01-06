CREATE TABLE [dbo].[chat_users] (
    [user_id]    NCHAR (35)    NOT NULL,
    [uname]      NVARCHAR (30) NOT NULL,
    [session_ip] NCHAR (15)    NOT NULL,
    [active]     SMALLINT      NOT NULL
);

