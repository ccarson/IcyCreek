ALTER TABLE [dbo].[cal_event]
    ADD CONSTRAINT [DF_cal_event_EventUpdateDate] DEFAULT (NULL) FOR [EventUpdateDate];

