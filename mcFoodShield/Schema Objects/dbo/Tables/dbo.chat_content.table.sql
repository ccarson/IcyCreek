CREATE TABLE [dbo].[chat_content] (
    [line_id]    INT            IDENTITY (1, 1) NOT NULL,
    [room_id]    INT            NOT NULL,
    [action]     INT            NOT NULL,
    [user_id]    NCHAR (35)     NOT NULL,
    [uname]      NVARCHAR (30)  NOT NULL,
    [content]    NVARCHAR (MAX) NOT NULL,
    [recip_id]   NCHAR (35)     NOT NULL,
    [tstamp]     BIGINT         NULL,
    [session_ip] NCHAR (15)     NOT NULL
);

