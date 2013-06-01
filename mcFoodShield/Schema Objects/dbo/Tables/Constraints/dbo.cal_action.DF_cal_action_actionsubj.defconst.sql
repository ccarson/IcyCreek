ALTER TABLE [dbo].[cal_action]
    ADD CONSTRAINT [DF_cal_action_actionsubj] DEFAULT (N'') FOR [actionsubj];

