CREATE TABLE [dbo].[room_users] (
    [room_id]  INT           NOT NULL,
    [user_id]  NCHAR (35)    NOT NULL,
    [uname]    NVARCHAR (30) NOT NULL,
    [pingtime] DATETIME2 (0) NOT NULL,
    [active]   SMALLINT      NOT NULL
);

