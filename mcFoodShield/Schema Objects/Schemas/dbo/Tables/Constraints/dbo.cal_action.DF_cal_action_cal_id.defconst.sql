ALTER TABLE [dbo].[cal_action]
    ADD CONSTRAINT [DF_cal_action_cal_id] DEFAULT ('0') FOR [cal_id];

