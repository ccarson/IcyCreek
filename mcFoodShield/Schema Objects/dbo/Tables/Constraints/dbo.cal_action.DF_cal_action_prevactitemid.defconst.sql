ALTER TABLE [dbo].[cal_action]
    ADD CONSTRAINT [DF_cal_action_prevactitemid] DEFAULT ('0') FOR [prevactitemid];

