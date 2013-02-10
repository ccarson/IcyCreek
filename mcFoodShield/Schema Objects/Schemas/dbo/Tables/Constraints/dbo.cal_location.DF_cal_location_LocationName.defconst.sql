ALTER TABLE [dbo].[cal_location]
    ADD CONSTRAINT [DF_cal_location_LocationName] DEFAULT (N'') FOR [LocationName];

