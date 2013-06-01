ALTER TABLE [dbo].[cal_action]
    ADD CONSTRAINT [DF_cal_action_actionitemid] DEFAULT ('0') FOR [actionitemid];

