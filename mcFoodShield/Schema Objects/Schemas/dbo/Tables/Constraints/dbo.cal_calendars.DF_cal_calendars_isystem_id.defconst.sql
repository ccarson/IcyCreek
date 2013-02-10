ALTER TABLE [dbo].[cal_calendars]
    ADD CONSTRAINT [DF_cal_calendars_isystem_id] DEFAULT ('0') FOR [isystem_id];

