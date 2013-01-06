ALTER TABLE [dbo].[cal_actiontask]
    ADD CONSTRAINT [DF_cal_actiontask_inactive] DEFAULT ((0)) FOR [inactive];

