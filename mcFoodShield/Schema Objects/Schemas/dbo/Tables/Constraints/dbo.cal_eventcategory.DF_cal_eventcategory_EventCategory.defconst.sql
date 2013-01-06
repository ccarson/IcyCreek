ALTER TABLE [dbo].[cal_eventcategory]
    ADD CONSTRAINT [DF_cal_eventcategory_EventCategory] DEFAULT (N'') FOR [EventCategory];

