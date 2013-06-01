ALTER TABLE [dbo].[cal_action]
    ADD CONSTRAINT [DF_cal_action_dateclosed] DEFAULT (NULL) FOR [dateclosed];

