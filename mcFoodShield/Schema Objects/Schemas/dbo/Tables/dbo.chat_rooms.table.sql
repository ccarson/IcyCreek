CREATE TABLE [dbo].[chat_rooms] (
    [room_id]       INT           IDENTITY (2, 1) NOT NULL,
    [room_name]     NVARCHAR (30) NOT NULL,
    [permanent]     INT           NOT NULL,
    [allow_rename]  INT           NOT NULL,
    [allow_private] INT           NOT NULL
);

