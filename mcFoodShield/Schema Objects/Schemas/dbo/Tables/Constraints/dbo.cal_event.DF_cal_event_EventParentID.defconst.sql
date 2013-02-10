ALTER TABLE [dbo].[cal_event]
    ADD CONSTRAINT [DF_cal_event_EventParentID] DEFAULT ('0') FOR [EventParentID];

