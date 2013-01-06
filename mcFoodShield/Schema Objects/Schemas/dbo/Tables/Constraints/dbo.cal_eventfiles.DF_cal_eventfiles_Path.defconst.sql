ALTER TABLE [dbo].[cal_eventfiles]
    ADD CONSTRAINT [DF_cal_eventfiles_Path] DEFAULT (N'') FOR [Path];

