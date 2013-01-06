ALTER TABLE [dbo].[cal_action]
    ADD CONSTRAINT [DF_cal_action_datedue] DEFAULT (NULL) FOR [datedue];

