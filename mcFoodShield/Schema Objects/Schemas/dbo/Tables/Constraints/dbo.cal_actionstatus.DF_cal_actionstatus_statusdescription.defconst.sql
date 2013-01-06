ALTER TABLE [dbo].[cal_actionstatus]
    ADD CONSTRAINT [DF_cal_actionstatus_statusdescription] DEFAULT (N'') FOR [statusdescription];

