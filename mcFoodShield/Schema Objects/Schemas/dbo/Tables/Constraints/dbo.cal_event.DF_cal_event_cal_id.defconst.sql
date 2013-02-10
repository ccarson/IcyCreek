ALTER TABLE [dbo].[cal_event]
    ADD CONSTRAINT [DF_cal_event_cal_id] DEFAULT ('0') FOR [cal_id];

