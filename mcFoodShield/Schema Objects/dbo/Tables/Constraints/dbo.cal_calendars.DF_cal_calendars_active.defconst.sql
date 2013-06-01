ALTER TABLE [dbo].[cal_calendars]
    ADD CONSTRAINT [DF_cal_calendars_active] DEFAULT ((0)) FOR [active];

