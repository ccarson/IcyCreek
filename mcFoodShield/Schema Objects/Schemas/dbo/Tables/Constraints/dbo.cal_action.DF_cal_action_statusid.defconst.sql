ALTER TABLE [dbo].[cal_action]
    ADD CONSTRAINT [DF_cal_action_statusid] DEFAULT ('0') FOR [statusid];

