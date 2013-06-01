ALTER TABLE [dbo].[cal_event]
    ADD CONSTRAINT [DF_cal_event_EventRepeat] DEFAULT ((0)) FOR [EventRepeat];

