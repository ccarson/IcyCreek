ALTER TABLE [dbo].[cal_location]
    ADD CONSTRAINT [DF_cal_location_Zip] DEFAULT (N'') FOR [Zip];

