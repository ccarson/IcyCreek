ALTER TABLE [dbo].[cal_event]
    ADD CONSTRAINT [DF_cal_event_AddedBy] DEFAULT ('0') FOR [AddedBy];

