ALTER TABLE [dbo].[cal_event]
    ADD CONSTRAINT [DF_cal_event_EventDate] DEFAULT (NULL) FOR [EventDate];

