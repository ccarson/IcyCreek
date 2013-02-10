ALTER TABLE [dbo].[cal_eventfiles]
    ADD CONSTRAINT [DF_cal_eventfiles_Caption] DEFAULT (N'') FOR [Caption];

