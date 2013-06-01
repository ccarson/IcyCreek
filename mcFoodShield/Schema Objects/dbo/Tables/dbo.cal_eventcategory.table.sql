CREATE TABLE [dbo].[cal_eventcategory] (
    [EventCatID]    INT           IDENTITY (5, 1) NOT NULL,
    [EventCategory] NVARCHAR (50) NULL,
    [Inactive]      BIT           NOT NULL,
    [catcolor]      NVARCHAR (50) NULL
);

