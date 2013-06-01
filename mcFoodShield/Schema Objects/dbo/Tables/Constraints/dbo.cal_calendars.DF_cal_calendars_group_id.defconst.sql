ALTER TABLE [dbo].[cal_calendars]
    ADD CONSTRAINT [DF_cal_calendars_group_id] DEFAULT ('0') FOR [group_id];

