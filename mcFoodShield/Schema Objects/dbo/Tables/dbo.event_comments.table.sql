CREATE TABLE [dbo].[event_comments] (
    [event_commentsID]    INT           IDENTITY (17, 1) NOT NULL,
    [event_comments_name] VARCHAR (100) NULL,
    [event_comments_date] DATETIME2 (0) NULL,
    [eventFK]             INT           NOT NULL,
    [event_comment]       VARCHAR (MAX) NULL
);

