﻿ALTER TABLE [dbo].[cal_action]
    ADD CONSTRAINT [DF_cal_action_displayid] DEFAULT ('0') FOR [displayid];

