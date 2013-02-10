ALTER TABLE [dbo].[cal_event]
    ADD CONSTRAINT [DF_cal_event_Inactive] DEFAULT ((0)) FOR [Inactive];

