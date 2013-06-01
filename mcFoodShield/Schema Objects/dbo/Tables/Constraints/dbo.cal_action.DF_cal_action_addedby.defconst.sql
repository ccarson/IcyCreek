ALTER TABLE [dbo].[cal_action]
    ADD CONSTRAINT [DF_cal_action_addedby] DEFAULT ('0') FOR [addedby];

