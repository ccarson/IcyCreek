ALTER TABLE [dbo].[cal_action]
    ADD CONSTRAINT [DF_cal_action_actioneeuserID] DEFAULT ('0') FOR [actioneeuserID];

