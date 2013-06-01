ALTER TABLE [dbo].[cal_event]
    ADD CONSTRAINT [DF_cal_event_EventName] DEFAULT (N'') FOR [EventName];

