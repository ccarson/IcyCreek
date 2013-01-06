CREATE TABLE [dbo].[p_polls] (
    [id]              INT            IDENTITY (21, 1) NOT NULL,
    [name]            NVARCHAR (50)  NULL,
    [description]     NVARCHAR (MAX) NULL,
    [thankYouMessage] NVARCHAR (255) NULL,
    [group_id]        INT            NOT NULL,
    [active]          BIT            NOT NULL,
    [isystem_id]      INT            NOT NULL,
    [filename]        NVARCHAR (255) NULL,
    [registered]      BIT            NOT NULL,
    [UUID]            NVARCHAR (45)  NOT NULL,
    [start_date]      DATE           NULL,
    [end_date]        DATE           NULL,
    [deleted]         TINYINT        NULL
);

