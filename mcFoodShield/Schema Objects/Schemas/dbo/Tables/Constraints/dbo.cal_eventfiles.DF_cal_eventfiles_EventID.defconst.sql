ALTER TABLE [dbo].[cal_eventfiles]
    ADD CONSTRAINT [DF_cal_eventfiles_EventID] DEFAULT ('0') FOR [EventID];

