ALTER TABLE [dbo].[cal_event]
    ADD CONSTRAINT [DF_cal_event_EventNoTime] DEFAULT ((0)) FOR [EventNoTime];

