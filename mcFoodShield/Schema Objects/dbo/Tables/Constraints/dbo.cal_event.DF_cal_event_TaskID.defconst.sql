ALTER TABLE [dbo].[cal_event]
    ADD CONSTRAINT [DF_cal_event_TaskID] DEFAULT ('0') FOR [TaskID];

