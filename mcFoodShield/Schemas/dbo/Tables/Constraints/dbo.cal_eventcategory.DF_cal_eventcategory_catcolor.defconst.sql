ALTER TABLE [dbo].[cal_eventcategory]
    ADD CONSTRAINT [DF_cal_eventcategory_catcolor] DEFAULT (N'') FOR [catcolor];

