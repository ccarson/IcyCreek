ALTER TABLE [dbo].[cal_event]
    ADD CONSTRAINT [DF_cal_event_EventDateEnd] DEFAULT (NULL) FOR [EventDateEnd];

