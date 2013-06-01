ALTER TABLE [dbo].[cal_actiontaskuser]
    ADD CONSTRAINT [DF_cal_actiontaskuser_TaskID] DEFAULT ('0') FOR [TaskID];

