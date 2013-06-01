ALTER TABLE [dbo].[cal_reminder]
    ADD CONSTRAINT [DF_cal_reminder_EventID] DEFAULT ('0') FOR [EventID];

