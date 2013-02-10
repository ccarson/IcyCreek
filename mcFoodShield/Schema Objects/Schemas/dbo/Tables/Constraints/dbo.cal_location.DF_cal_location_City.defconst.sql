ALTER TABLE [dbo].[cal_location]
    ADD CONSTRAINT [DF_cal_location_City] DEFAULT (N'') FOR [City];

