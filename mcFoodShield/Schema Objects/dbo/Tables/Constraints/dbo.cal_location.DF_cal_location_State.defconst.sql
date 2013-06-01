ALTER TABLE [dbo].[cal_location]
    ADD CONSTRAINT [DF_cal_location_State] DEFAULT (N'') FOR [State];

