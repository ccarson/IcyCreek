ALTER TABLE [dbo].[cal_action]
    ADD CONSTRAINT [DF_cal_action_actiondescription] DEFAULT (N'') FOR [actiondescription];

