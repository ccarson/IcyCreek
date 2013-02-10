ALTER TABLE [dbo].[cal_action]
    ADD CONSTRAINT [DF_cal_action_taskid] DEFAULT ('0') FOR [taskid];

