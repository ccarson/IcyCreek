ALTER TABLE [dbo].[cal_eventfiles]
    ADD CONSTRAINT [DF_cal_eventfiles_NewsID] DEFAULT ('0') FOR [NewsID];

