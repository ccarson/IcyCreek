ALTER TABLE [dbo].[cal_reminder]
    ADD CONSTRAINT [DF_cal_reminder_UserID] DEFAULT ('0') FOR [UserID];

