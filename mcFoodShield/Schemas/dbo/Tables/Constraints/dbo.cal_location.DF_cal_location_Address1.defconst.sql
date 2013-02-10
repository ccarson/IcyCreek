ALTER TABLE [dbo].[cal_location]
    ADD CONSTRAINT [DF_cal_location_Address1] DEFAULT (N'') FOR [Address1];

