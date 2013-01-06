ALTER TABLE [dbo].[cal_eventcategory]
    ADD CONSTRAINT [DF_cal_eventcategory_Inactive] DEFAULT ((0)) FOR [Inactive];

