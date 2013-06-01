ALTER TABLE [dbo].[cal_actiontask]
    ADD CONSTRAINT [DF_cal_actiontask_TaskDescription] DEFAULT (N'') FOR [TaskDescription];

