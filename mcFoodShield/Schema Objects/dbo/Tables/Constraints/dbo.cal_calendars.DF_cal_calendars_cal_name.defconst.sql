ALTER TABLE [dbo].[cal_calendars]
    ADD CONSTRAINT [DF_cal_calendars_cal_name] DEFAULT (N'') FOR [cal_name];

