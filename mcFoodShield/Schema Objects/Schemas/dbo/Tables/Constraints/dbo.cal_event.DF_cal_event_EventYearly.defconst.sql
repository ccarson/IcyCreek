ALTER TABLE [dbo].[cal_event]
    ADD CONSTRAINT [DF_cal_event_EventYearly] DEFAULT ((0)) FOR [EventYearly];

