﻿ALTER TABLE [dbo].[event_info]
    ADD CONSTRAINT [DF_event_info_eventEndDate] DEFAULT (NULL) FOR [eventEndDate];

