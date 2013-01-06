CREATE TABLE [dbo].[event] (
    [id]           INT           IDENTITY (1, 1) NOT NULL,
    [name]         VARCHAR (100) NOT NULL,
    [description]  TEXT          NOT NULL,
    [date_started] SMALLDATETIME NOT NULL,
    [date_ended]   SMALLDATETIME NULL,
    [time_started] VARCHAR (5)   NOT NULL,
    [time_ended]   VARCHAR (5)   NOT NULL,
    [is_all_day]   TINYINT       NOT NULL,
    [repeat_type]  TINYINT       NOT NULL,
    [color]        VARCHAR (6)   NOT NULL,
    [date_updated] SMALLDATETIME NOT NULL,
    [date_created] SMALLDATETIME NOT NULL
);

