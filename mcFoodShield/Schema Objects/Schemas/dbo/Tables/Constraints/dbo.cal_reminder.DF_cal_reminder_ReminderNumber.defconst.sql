ALTER TABLE [dbo].[cal_reminder]
    ADD CONSTRAINT [DF_cal_reminder_ReminderNumber] DEFAULT ('0') FOR [ReminderNumber];

