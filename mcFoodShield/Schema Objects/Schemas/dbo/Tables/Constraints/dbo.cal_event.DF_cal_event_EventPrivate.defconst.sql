﻿ALTER TABLE [dbo].[cal_event]
    ADD CONSTRAINT [DF_cal_event_EventPrivate] DEFAULT ((0)) FOR [EventPrivate];

