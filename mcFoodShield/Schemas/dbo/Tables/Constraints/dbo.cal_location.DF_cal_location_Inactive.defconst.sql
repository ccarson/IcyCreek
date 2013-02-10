ALTER TABLE [dbo].[cal_location]
    ADD CONSTRAINT [DF_cal_location_Inactive] DEFAULT ((0)) FOR [Inactive];

