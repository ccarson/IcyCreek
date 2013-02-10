ALTER TABLE [dbo].[cal_event]
    ADD CONSTRAINT [DF_cal_event_EventRType] DEFAULT ('0') FOR [EventRType];

