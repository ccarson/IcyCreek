ALTER TABLE [dbo].[cal_action]
    ADD CONSTRAINT [DF_cal_action_leaduserid] DEFAULT ('0') FOR [leaduserid];

