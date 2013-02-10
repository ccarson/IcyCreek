ALTER TABLE [dbo].[cal_action]
    ADD CONSTRAINT [DF_cal_action_parentid] DEFAULT ('0') FOR [parentid];

