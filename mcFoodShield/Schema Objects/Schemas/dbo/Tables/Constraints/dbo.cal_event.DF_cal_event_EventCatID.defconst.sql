ALTER TABLE [dbo].[cal_event]
    ADD CONSTRAINT [DF_cal_event_EventCatID] DEFAULT ('0') FOR [EventCatID];

