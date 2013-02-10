CREATE TABLE [dbo].[cal_calendars] (
    [id]         INT            IDENTITY (266, 1) NOT NULL,
    [cal_name]   NVARCHAR (150) NULL,
    [group_id]   INT            NOT NULL,
    [makepublic] BIT            NOT NULL,
    [active]     BIT            NOT NULL,
    [isystem_id] INT            NOT NULL
);

